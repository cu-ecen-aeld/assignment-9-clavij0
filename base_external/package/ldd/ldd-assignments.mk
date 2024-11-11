
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = '9ef1a0f'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'https://github.com/cu-ecen-aeld/assignment-7-clavij0.git'
#LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-clavij0.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
#AESD_ASSIGNMENTS_OVERRIDE_SRCDIR=/home/clavijo/Documents/Coursera/LinuxSPIBuildroot/finder-app

#LDD_MODULE_SUBDIRS= misc-modules scull

LDD_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
LDD_MODULE_SUBDIRS = scull/
LDD_MODULE_SUBDIRS += misc-modules/


#Compile Kernel modules
# define LDD_BUILD_CMDS
#     # Compiling modules
# 	# for dir in $(LDD_MODULE_SUBDIRS) do; \
# 	#  	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$$dir modules || exit 1; \
#     # done
	
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules

# endef

# Install compiled kernel modules into target directory
define LDD_INSTALL_TARGET_CMDS
    # Copy the misc-modules and scull modules to the target filesystem
	#for dir $(LDD_MODULE_SUBDIRS) do; \
    #    find $(@D)/$$dir -name '*.ko' -exec $(INSTALL) -D -m 644 {} $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/ \; ; \
	#done
	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)
	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)
	
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin

endef

$(eval $(kernel-module))
$(eval $(generic-package))
