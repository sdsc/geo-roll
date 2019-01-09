ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME       = sdsc-geo-roll-test
VERSION    = 1
RELEASE    = 7
PKGROOT    = /root/rolltests

RPM.EXTRAS = AutoReq:No
RPM.FILES  = $(PKGROOT)/geo.t
