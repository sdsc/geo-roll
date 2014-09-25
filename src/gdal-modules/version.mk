NAME        = gdal-modules
RELEASE     = 0
PKGROOT     = /opt/modulefiles/applications/gdal

VERSION_SRC = $(REDHAT.ROOT)/src/gdal/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS = AutoReq:No
