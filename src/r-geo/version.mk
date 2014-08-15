NAME               = r-geo
RELEASE            = 1
PKGROOT            = /opt/R
VERSION            = 1.0

SRC_SUBDIR         = r-geo

RGDAL_NAME         = rgdal
RGDAL_VERSION      = 0.8-16
RGDAL_SUFFIX       = tar.gz
RGDAL_PKG          = $(RGDAL_NAME)_$(RGDAL_VERSION).$(RGDAL_SUFFIX)
RGDAL_DIR          = $(RGDAL_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(RGEOS_PKG) $(RGDAL_PKG)

RPM.EXTRAS         = AutoReq:No
