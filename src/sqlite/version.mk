ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-sqlite
VERSION        = 3.35.5
RELEASE        = 0
PKGROOT        = /opt/sqlite

SRC_SUBDIR     = sqlite

SOURCE_NAME    = sqlite
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 3350500
SOURCE_PKG     = $(SOURCE_NAME)-autoconf-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
