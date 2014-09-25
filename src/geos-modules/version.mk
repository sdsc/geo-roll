NAME        = geos-modules
RELEASE     = 0
PKGROOT     = /opt/modulefiles/applications/geos

VERSION_SRC = $(REDHAT.ROOT)/src/geos/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS = AutoReq:No
