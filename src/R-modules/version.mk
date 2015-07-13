NAME              = sdsc-geo-R-modules
VERSION           = 4
RELEASE           = 0
PKGROOT           = /opt/R/local/lib

SRC_SUBDIR        = R-modules

# Ordered with dependent modules after prerequisites
R_MODULES = sp zoo xts intervals rgdal rgeos spacetime FNN gstat foreign \
            shapefiles Rcpp plyr RSAGA

FNN_NAME          = FNN
FNN_SUFFIX        = tar.gz
FNN_VERSION       = 1.1
FNN_PKG           = $(FNN_NAME)_$(FNN_VERSION).$(FNN_SUFFIX)
FNN_DIR           = $(FNN_NAME)

FOREIGN_NAME      = foreign
FOREIGN_SUFFIX    = tar.gz
FOREIGN_VERSION   = 0.8-63
FOREIGN_PKG       = $(FOREIGN_NAME)_$(FOREIGN_VERSION).$(FOREIGN_SUFFIX)
FOREIGN_DIR       = $(FOREIGN_NAME)

GSTAT_NAME        = gstat
GSTAT_SUFFIX      = tar.gz
GSTAT_VERSION     = 1.0-21
GSTAT_PKG         = $(GSTAT_NAME)_$(GSTAT_VERSION).$(GSTAT_SUFFIX)
GSTAT_DIR         = $(GSTAT_NAME)

INTERVALS_NAME    = intervals
INTERVALS_SUFFIX  = tar.gz
INTERVALS_VERSION = 0.15.0
INTERVALS_PKG     = $(INTERVALS_NAME)_$(INTERVALS_VERSION).$(INTERVALS_SUFFIX)
INTERVALS_DIR     = $(INTERVALS_NAME)

PLYR_NAME         = plyr
PLYR_SUFFIX       = tar.gz
PLYR_VERSION      = 1.8.1
PLYR_PKG          = $(PLYR_NAME)_$(PLYR_VERSION).$(PLYR_SUFFIX)
PLYR_DIR          = $(PLYR_NAME)

RCPP_NAME         = Rcpp
RCPP_SUFFIX       = tar.gz
RCPP_VERSION      = 0.11.5
RCPP_PKG          = $(RCPP_NAME)_$(RCPP_VERSION).$(RCPP_SUFFIX)
RCPP_DIR          = $(RCPP_NAME)

RGDAL_NAME        = rgdal
RGDAL_SUFFIX      = tar.gz
RGDAL_VERSION     = 0.9-1
RGDAL_PKG         = $(RGDAL_NAME)_$(RGDAL_VERSION).$(RGDAL_SUFFIX)
RGDAL_DIR         = $(RGDAL_NAME)

RGEOS_NAME        = rgeos
RGEOS_SUFFIX      = tar.gz
RGEOS_VERSION     = 0.3-8
RGEOS_PKG         = $(RGEOS_NAME)_$(RGEOS_VERSION).$(RGEOS_SUFFIX)
RGEOS_DIR         = $(RGEOS_NAME)

RSAGA_NAME        = RSAGA
RSAGA_SUFFIX      = tar.gz
RSAGA_VERSION     = 0.93-6
RSAGA_PKG         = $(RSAGA_NAME)_$(RSAGA_VERSION).$(RSAGA_SUFFIX)
RSAGA_DIR         = $(RSAGA_NAME)

SHAPEFILES_NAME   = shapefiles
SHAPEFILES_SUFFIX = tar.gz
SHAPEFILES_VERSION= 0.7
SHAPEFILES_PKG    = $(SHAPEFILES_NAME)_$(SHAPEFILES_VERSION).$(SHAPEFILES_SUFFIX)
SHAPEFILES_DIR    = $(SHAPEFILES_NAME)

SP_NAME           = sp
SP_SUFFIX         = tar.gz
SP_VERSION        = 1.0-17
SP_PKG            = $(SP_NAME)_$(SP_VERSION).$(SP_SUFFIX)
SP_DIR            = $(SP_NAME)

SPACETIME_NAME    = spacetime
SPACETIME_SUFFIX  = tar.gz
SPACETIME_VERSION = 1.1-3
SPACETIME_PKG     = $(SPACETIME_NAME)_$(SPACETIME_VERSION).$(SPACETIME_SUFFIX)
SPACETIME_DIR     = $(SPACETIME_NAME)

XTS_NAME          = xts
XTS_SUFFIX        = tar.gz
XTS_VERSION       = 0.9-7
XTS_PKG           = $(XTS_NAME)_$(XTS_VERSION).$(XTS_SUFFIX)
XTS_DIR           = $(XTS_NAME)

ZOO_NAME          = zoo
ZOO_SUFFIX        = tar.gz
ZOO_VERSION       = 1.7-11
ZOO_PKG           = $(ZOO_NAME)_$(ZOO_VERSION).$(ZOO_SUFFIX)
ZOO_DIR           = $(ZOO_NAME)

TAR_GZ_PKGS       = \
  $(FNN_PKG) $(FOREIGN_PKG) $(GSTAT_PKG) $(INTERVALS_PKG) $(PLYR_PKG) \
  $(RCPP_PKG) $(RGDAL_PKG) $(RGEOS_PKG) $(RSAGA_PKG) $(SHAPEFILES_PKG) \
  $(SP_PKG) $(SPACETIME_PKG) $(XTS_PKG) $(ZOO_PKG)

RPM.EXTRAS        = AutoReq:No
