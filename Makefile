# =====================
# Build Base Docker Images
# =====================

cleanup:
	-rm Dockerfile

docker_build:
	docker build --rm=true --force-rm=true --no-cache . 

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


# =======================================
#  Tests
#
#  TODO - AUTOMATE
# =======================================


# ==============
#  Mongo
# ==============

mongodb_generate_debian:
	python build_dockerfile.py --target=debian --release=7 --app=mongodb

mongodb_generate_ubuntu: cleanup
	python build_dockerfile.py --target=ubuntu --release=14 --app=mongodb


mongodb_generate_centos: cleanup
	python build_dockerfile.py --target=centos --release=6 --app=mongodb


test_mongodb_debian: cleanup mongodb_generate_debian docker_build
test_mongodb_ubuntu: cleanup mongodb_generate_ubuntu docker_build
test_mongodb_centos: cleanup mongodb_generate_centos docker_build

# ==============
#  Git
# ==============
git_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=git

test_git_ubuntu: cleanup git_generate_ubuntu docker_build

