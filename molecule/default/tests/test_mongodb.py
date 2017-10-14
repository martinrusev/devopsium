import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_mongodb_repo_file(host):
	if host.system_info.distribution is 'debian':
		repo_file = '/etc/apt/sources.list.d/mongodb-org-3.4.list'
	else:
		repo_file = '/etc/yum.repos.d/mongodb-org-3.4.repo'

	f = host.file(repo_file)
	
	assert f.exists
