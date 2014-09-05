BUILD=build/package
SRC=../

PACKAGES_PATH=/home/martin/colonizer-packages
DEBIAN_REPO_PATH=$(PACKAGES_PATH)/debian/
RPM_REPO_PATH=$(PACKAGES_PATH)/centos/
VERSION=`cat $(SRC)/VERSION`

FPM_BUILD=fpm --epoch 1 -s dir -e -C $(BUILD) \
-a all -m "Amon Packages <packages@amon.cx>" \
--url "http://colonizer.amon.cx/" \
--description "`cat desc`"\
-v $(VERSION) \
--vendor "Martin Rusev"

clean:
	rm -rf build
	rm -f *.deb *.rpm


install_base: 
	mkdir -p $(BUILD)
	mkdir -p $(BUILD)/usr/local/colonizer

	
	mkdir -p $(BUILD)/var/log/colonizer
	mkdir -p $(BUILD)/usr/bin


	cp -r $(SRC)/colonizer $(BUILD)/usr/bin/colonizer

	@echo $(VERSION)



# =====================
# Build
# =====================
build_deb: clean install_base
	FPM_EDITOR="echo 'Replaces: colonizer (<= $(VERSION))' >>" \
$(FPM_BUILD) -t deb \
-n colonizer \
-d "adduser" \
-d "git" \
--post-install debian/postinst \
--post-uninstall debian/postrm \
.
	

build_rpm: clean install_base
	FPM_EDITOR="echo ''>>"  \
$(FPM_BUILD) -t rpm \
-n "colonizer" \
-d "git" \
--conflicts "colonizer < $(VERSION)" \
--post-install	   rpm/postinst \
--post-uninstall   rpm/postrm \
.


all: clean build_deb build_rpm



# =====================
# Test
# =====================
test_debian:
	cp debian/Dockerfile Dockerfile
	docker build --rm=true --no-cache . 
	rm Dockerfile


test_rpm:
	cp rpm/Dockerfile Dockerfile
	docker build --rm=true --no-cache . 
	rm Dockerfile



test_all: test_debian test_rpm


# =====================
# Deploy
# =====================
update_debian_repo:
	cp "colonizer_$(VERSION)_all.deb" $(DEBIAN_REPO_PATH)
	find $(DEBIAN_REPO_PATH)  -name \*.deb -exec reprepro --ask-passphrase -Vb $(DEBIAN_REPO_PATH)repo includedeb amon {} \;

update_rpm_repo:
	cp "colonizer-$(VERSION)-1.noarch.rpm" $(RPM_REPO_PATH)
	createrepo --update $(RPM_REPO_PATH)

deploy: update_debian_repo update_rpm_repo
	python s3uploader.py