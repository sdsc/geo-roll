NAME          = sdsc-geo-R-modules
VERSION       = 6
RELEASE       = 0
PKGROOT       = /opt/R/local/lib

SRC_SUBDIR    = R-modules
R_MODULES = rgdal rgeos

RGDAL_NAME    = rgdal
RGDAL_SUFFIX  = tar.gz
RGDAL_VERSION = 1.5-23
RGDAL_PKG     = $(RGDAL_NAME)_$(RGDAL_VERSION).$(RGDAL_SUFFIX)
RGDAL_DIR     = $(RGDAL_NAME)

RGEOS_NAME    = rgeos
RGEOS_SUFFIX  = tar.gz
RGEOS_VERSION = 0.5-5
RGEOS_PKG     = $(RGEOS_NAME)_$(RGEOS_VERSION).$(RGEOS_SUFFIX)
RGEOS_DIR     = $(RGEOS_NAME)

TAR_GZ_PKGS   = $(RGDAL_PKG) $(RGEOS_PKG)

RPM.EXTRAS    = AutoReq:No
RPM.PREFIX    = $(PKGROOT)
