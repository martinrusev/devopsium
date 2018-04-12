import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_mongodb_repo_file(host):
	if host.system_info.distribution is 'debian':
		repo_file = '/etc/apt/sources.list.d/docker-ce.list'
	else:
		repo_file = '/etc/yum.repos.d/docker-ce.repo'

	f = host.file(repo_file)
	
	assert f.exists

	if host.system_info.distribution is 'debian':
		f.content_string == "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"