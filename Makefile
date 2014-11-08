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

_mongodb_generate_debian:
	python build_dockerfile.py --target=debian --release=7 --app=mongodb

_mongodb_generate_ubuntu: cleanup
	python build_dockerfile.py --target=ubuntu --release=14 --app=mongodb


_mongodb_generate_centos: cleanup
	python build_dockerfile.py --target=centos --release=6 --app=mongodb


test_mongodb_debian: cleanup _mongodb_generate_debian docker_build
test_mongodb_ubuntu: cleanup _mongodb_generate_ubuntu docker_build
test_mongodb_centos: cleanup _mongodb_generate_centos docker_build


# ==============
#  Redis
# ==============
_redis_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=redis

_redis_generate_debian: 
	python build_dockerfile.py --target=debian --release=7 --app=redis

test_redis_ubuntu: cleanup _redis_generate_ubuntu docker_build
test_redis_debian: cleanup _redis_generate_debian docker_build

# ==============
#  Ruby
# ==============
_ruby_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=ruby

test_ruby_ubuntu: cleanup _ruby_generate_ubuntu docker_build



# ==============
#  Git
# ==============
_git_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=git

test_git_ubuntu: cleanup _git_generate_ubuntu docker_build


# ==============
#  Docker
# ==============
_docker_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=docker

test_docker_ubuntu: cleanup _docker_generate_ubuntu docker_build



# ==============
#  Apache
# ==============
_apache_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=apache

test_apache_ubuntu: cleanup _apache_generate_ubuntu docker_build



# ==============
#  Nginx
# ==============
_nginx_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=nginx


_nginx_generate_centos: 
	python build_dockerfile.py --target=centos --release=6 --app=nginx

test_nginx_ubuntu: cleanup _nginx_generate_ubuntu docker_build
test_nginx_centos: cleanup _nginx_generate_centos docker_build


# ==============
#  PostgreSQL
# ==============
_postgresql_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=postgresql

_postgresql_generate_debian: 
	python build_dockerfile.py --target=debian --release=7 --app=postgresql

test_postgresql_ubuntu: cleanup _postgresql_generate_ubuntu docker_build
test_postgresql_debian: cleanup _postgresql_generate_debian docker_build



# ==============
#  MariaDB
# ==============
_mariadb_generate_ubuntu: 
	python build_dockerfile.py --target=ubuntu --release=14 --app=mariadb

_mariadb_generate_debian: 
	python build_dockerfile.py --target=debian --release=7 --app=mariadb

_mariadb_generate_centos: 
	python build_dockerfile.py --target=centos --release=6 --app=mariadb

test_mariadb_ubuntu: cleanup _mariadb_generate_ubuntu docker_build
test_mariadb_debian: cleanup _mariadb_generate_debian docker_build
test_mariadb_centos: cleanup _mariadb_generate_centos docker_build


empty:
	@echo ""