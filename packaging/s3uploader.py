import boto
import boto.s3

import os.path
import sys
from ConfigParser import SafeConfigParser


base_path = "/home/martin/amon-packages"
key_file = os.path.join(base_path, 'amazon_keys.conf')

parser = SafeConfigParser()
parser.read(key_file)

AWS_ACCESS_KEY_ID = parser.get('amazon', 'key')
AWS_ACCESS_KEY_SECRET = parser.get('amazon', 'secret')

bucket_name = 'beta.packages.amon.cx'

repos = {
	'debian': {
		'prefix': 'repo', 
		'path':os.path.join(base_path, 'debian')
	},
	'centos': {
		'prefix': 'rpm',
		'path': os.path.join(base_path, 'centos')
	}
}

conn = boto.connect_s3(AWS_ACCESS_KEY_ID, AWS_ACCESS_KEY_SECRET)


bucket = conn.get_bucket(bucket_name,validate=True)
 
def percent_cb(complete, total):
	sys.stdout.write('.')
	sys.stdout.flush()

def upload(sourcepath, destpath):
	print "Uploading {0} to {1}".format(destpath, bucket_name)

	k = boto.s3.key.Key(bucket)
	k.key = destpath
	k.set_contents_from_filename(sourcepath, cb=percent_cb, num_cb=10)


filelist = []
def generate_filelist(path, prefix=""):
	
	for root, dirname, files in os.walk(path):
		for name in files:
			filename = os.path.join(prefix, root, name)
			filelist.append(filename)

for key, value in repos.items():
	generate_filelist(value['path'], prefix=value['prefix'])

# Cleanup
for key, value in repos.items():
	
	for bucket_key in bucket.list(prefix=value['prefix']):
		bucket_key.delete()


for key, value in repos.items():
	path = value['path'] if key == 'centos' else "{0}/repo".format(value['path'])
	prefix = value['prefix']

	for filename in filelist:
		if filename.startswith(path):
			destpath =  filename.replace(path, prefix)
			
			upload(filename, destpath)