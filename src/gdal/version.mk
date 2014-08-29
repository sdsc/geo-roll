NAME           = gdal
VERSION        = 1.9.2
RELEASE        = 2
PKGROOT        = /opt/gdal

SRC_SUBDIR     = gdal

SOURCE_NAME    = gdal
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
