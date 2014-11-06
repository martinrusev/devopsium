# =====================
# Build Base Docker Images
# =====================
build_debian:
	cp packaging/docker_base/Dockerfile.debian.7 Dockerfile
	docker build --tag='edgium.debian.7' --force-rm=true --rm=true --no-cache . 
	rm Dockerfile



# =====================
# Tests
# =====================
test_mongodb_debian:
	cp apps/mongodb/tests/Dockerfile.debian Dockerfile
	docker build --rm=true --force-rm=true --no-cache . 
	rm Dockerfile