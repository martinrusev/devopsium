BUILD=build/package
SRC=../

PACKAGES_PATH=/home/martin/falcon-packages
DEBIAN_REPO_PATH=$(PACKAGES_PATH)/debian/
RPM_REPO_PATH=$(PACKAGES_PATH)/centos/
VERSION=`cat $(SRC)/VERSION`

FPM_BUILD=fpm --epoch 1 -s dir -e -C $(BUILD) \
-a all -m "Amon Packages <packages@amon.cx>" \
--url "http://falcon.amon.cx/" \
--description "`cat desc`"\
-v $(VERSION) \
--vendor "Martin Rusev"

clean:
	rm -rf build
	rm -f *.deb *.rpm


# Layout all of the files common All flags should be before the first argument to both versions of the Agent in
# the build directory.
install_base: 
	mkdir -p $(BUILD)
	mkdir -p $(BUILD)/etc/falcon

	
	mkdir -p $(BUILD)/var/log/falcon
	mkdir -p $(BUILD)/usr/bin


	cp -r $(SRC)/falcon $(BUILD)/usr/bin/falcon

	@echo $(VERSION)



# =====================
# Build
# =====================
falcon_deb: clean install_base
	FPM_EDITOR="echo 'Replaces: falcon (<= $(VERSION))' >>" \
$(FPM_BUILD) -t deb \
-n falcon \
-d "adduser" \
-d "git" \
--post-install debian/postinst \
--post-uninstall debian/postrm \
.
	

falcon_rpm: clean install_base
	FPM_EDITOR="echo ''>>"  \
$(FPM_BUILD) -t rpm \
-n "falcon" \
-d "git" \
--conflicts "falcon < $(VERSION)" \
--post-install	   rpm/postinst \
--post-uninstall   rpm/postrm \
.


all: clean falcon_deb falcon_rpm



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
	cp "falcon_$(VERSION)_all.deb" $(DEBIAN_REPO_PATH)
	find $(DEBIAN_REPO_PATH)  -name \*.deb -exec reprepro --ask-passphrase -Vb $(DEBIAN_REPO_PATH)repo includedeb amon {} \;

update_rpm_repo:
	cp "falcon-$(VERSION)-1.noarch.rpm" $(RPM_REPO_PATH)
	createrepo --update $(RPM_REPO_PATH)

deploy: update_debian_repo update_rpm_repo
	python s3uploader.py