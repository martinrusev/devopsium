BUILD=build/package
SRC=../

PACKAGES_PATH=/home/martin/falcon-packages
DEBIAN_REPO_PATH=$(PACKAGES_PATH)/debian/
RPM_REPO_PATH=$(PACKAGES_PATH)/centos/

FPM_BUILD=fpm --epoch 1 -s dir -e -C $(BUILD) \
-a all -m "Amon Packages <packages@amon.cx>" \
--url "http://amon.cx/" \
--description "`cat desc`"\
-v $(VERSION) \
--vendor Amon 

clean:
	rm -rf build
	rm -f *.deb *.rpm


# Layout all of the files common to both versions of the Agent in
# the build directory.
install_base: 
	mkdir -p $(BUILD)
	mkdir -p $(BUILD)/etc/falcon

	
	mkdir -p $(BUILD)/var/log/falcon
	mkdir -p $(BUILD)/usr/bin


	cp -r $(SRC)/falcon $(BUILD)/usr/bin/falcon

	@echo $(VERSION)



# =====================
# Ubuntu/Debian
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
	

# =====================
# CentOS/Fedora
# =====================
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