################################################################################
#
# nanomodbus.mk - Build rules for the nanomodbus library
#
################################################################################

LIBNANOMODBUS_VERSION = 39dabd42ac7d848f46ecdacfdda226753ca54b90
LIBNANOMODBUS_SITE_METHOD = git
LIBNANOMODBUS_SITE = git@github.com:2709926-ONTARIO-INC-ESP32-Components/nanoMODBUS.git

# Buildroot settings
LIBNANOMODBUS_INSTALL_STAGING = YES
LIBNANOMODBUS_INSTALL_TARGET = YES

define LIBNANOMODBUS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC) LD=$(TARGET_LD)
endef

define LIBNANOMODBUS_INSTALL_STAGING_CMDS
	$(INSTALL) -D $(@D)/libnanomodbus.so $(STAGING_DIR)/usr/lib/libnanomodbus.so
endef

define LIBNANOMODBUS_INSTALL_TARGET_CMDS
	echo $(@D)/libnanomodbus.so
	echo $(TARGET_DIR)/usr/lib/libnanomodbus.so
	$(INSTALL) -D -m 0755 $(@D)/libnanomodbus.so $(TARGET_DIR)/usr/lib/libnanomodbus.so
endef

# Register the package with Buildroot
$(eval $(generic-package))
