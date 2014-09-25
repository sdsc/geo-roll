NAME        = proj-modules
RELEASE     = 0
PKGROOT     = /opt/modulefiles/applications/proj

VERSION_SRC = $(REDHAT.ROOT)/src/proj/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS = AutoReq:No
