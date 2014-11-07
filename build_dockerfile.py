

import optparse
import sys

def main(argv):

	parser = optparse.OptionParser()
	parser.add_option('-t', '--target', help="Distro of choice - Ubuntu/Debian/Centos",)
	parser.add_option('-r','--release',help="Distro release - 6,7,12,14",)
	parser.add_option('-a','--app',  help="Application of choice - git, mongodb, apache",)
	
	options, remainder = parser.parse_args(argv)

	print 'TARGET    :', options.target
	print 'RELEASE   :', options.release
	print 'APP       :', options.app

	with open('Dockerfile','w+') as f:
		f.write("FROM edgium.{0}.{1}\n".format(options.target, options.release))
		f.write('RUN git -C /edgium pull\n')
		f.write("RUN ansible-playbook edgium/apps/{0}/main.yml -i edgium/hosts\n".format(options.app))
		f.write('CMD ["/bin/bash"]')


if __name__ == "__main__":
	main(sys.argv[1:])