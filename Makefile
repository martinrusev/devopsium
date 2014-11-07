# =====================
# Build Base Docker Images
# =====================

cleanup:
	rm Dockerfile

build_debian: cleanup
	# docker pull debian
	cp packaging/docker_base/Dockerfile.debian.7 Dockerfile
	docker build --tag='edgium.debian.7' --force-rm=true --rm=true --no-cache . 


build_ubuntu: cleanup
	# docker pull ubuntu
	cp packaging/docker_base/Dockerfile.ubuntu.14 Dockerfile
	docker build --tag='edgium.ubuntu.14' --force-rm=true --rm=true --no-cache . 


build_centos_six: cleanup
	# docker pull centos
	cp packaging/docker_base/Dockerfile.centos.6 Dockerfile
	docker build --tag='edgium.centos.6' --force-rm=true --rm=true --no-cache . 


# =====================
# Tests
# =====================
test_mongodb_debian: cleanup
	cp apps/mongodb/tests/Dockerfile.debian Dockerfile
	docker build --rm=true --force-rm=true --no-cache . 

test_mongodb_ubuntu: cleanup
	cp apps/mongodb/tests/Dockerfile.ubuntu Dockerfile
	docker build --rm=true --force-rm=true --no-cache . 


test_mongodb_centos: cleanup
	cp apps/mongodb/tests/Dockerfile.centos Dockerfile
	docker build --rm=true --force-rm=true --no-cache . 