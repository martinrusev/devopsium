BUILD=build/package
SRC=../

PACKAGES_PATH=/home/martin/amon-packages
DEBIAN_REPO_PATH=$(PACKAGES_PATH)/debian/
RPM_REPO_PATH=$(PACKAGES_PATH)/centos/
VERSION=`cat $(SRC)/VERSION`

FPM_BUILD=fpm --epoch 1 -s dir -e -C $(BUILD) \
-a all -m "Amon Packages <packages@amon.cx>" \
--url "http://edgium.amon.cx/" \
--description "`cat desc`"\
-v $(VERSION) \
--vendor "Martin Rusev"

clean:
	rm -rf build
	rm -f *.deb *.rpm


install_base: 
	mkdir -p $(BUILD)
	mkdir -p $(BUILD)/usr/local/edgium

	mkdir -p $(BUILD)/usr/bin


	cp -r $(SRC)/edgium $(BUILD)/usr/bin/edgium

	@echo $(VERSION)



# =====================
# Build
# =====================
build_deb: clean install_base
	FPM_EDITOR="echo 'Replaces: edgium (<= $(VERSION))' >>" \
$(FPM_BUILD) -t deb \
-n edgium \
-d "git" \
--post-install debian/postinst \
--post-uninstall debian/postrm \
.
	

build_rpm: clean install_base
	FPM_EDITOR="echo ''>>"  \
$(FPM_BUILD) -t rpm \
-n "edgium" \
-d "git" \
--conflicts "edgium < $(VERSION)" \
--post-install	   rpm/postinst \
--post-uninstall   rpm/postrm \
.


all: clean build_deb build_rpm

build_container:
	docker build --force-rm=true --rm=true --no-cache . 

# =====================
# Test
# =====================
test_debian:
	cp debian/Dockerfile Dockerfile
	sed -i s/EDGIUM_DEB_FILE/"edgium_$(VERSION)_all.deb"/g Dockerfile
	docker build --force-rm=true --rm=true --no-cache .  
	rm Dockerfile


test_rpm:
	cp rpm/Dockerfile Dockerfile
	sed -i s/EDGIUM_RPM_FILE/"edgium-$(VERSION)-1.noarch.rpm"/g Dockerfile
	docker build --force-rm=true --rm=true --no-cache . 
	rm Dockerfile



test_all: test_debian test_rpm

test_debian_repo:
	cp debian/Dockerfile.repo Dockerfile
	docker build --force-rm=true --rm=true --no-cache . 
	rm Dockerfile


test_rpm_repo:
	cp rpm/Dockerfile.repo Dockerfile
	cp rpm/edgium.repo edgium.repo
	docker build --force-rm=true --rm=true --no-cache . 
	rm Dockerfile
	rm edgium.repo


# =====================
# Deploy
# =====================
update_debian_repo:
	cp "edgium_$(VERSION)_all.deb" $(DEBIAN_REPO_PATH)
	find $(DEBIAN_REPO_PATH)  -name \*.deb -exec reprepro --ask-passphrase -Vb $(DEBIAN_REPO_PATH)repo includedeb amon {} \;

update_rpm_repo:
	cp "edgium-$(VERSION)-1.noarch.rpm" $(RPM_REPO_PATH)
	createrepo --update $(RPM_REPO_PATH)

deploy: update_debian_repo update_rpm_repo
	python s3uploader.py