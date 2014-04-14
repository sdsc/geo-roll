# installation script for R packages; pass installation root and openmpi root
# as arguments.

PKGROOT=$1
RGDAL_VERSION=$2
BUILD_PATH=$3
CONFIG_PATH=$4

CRANURL=http://cran.stat.ucla.edu
yum -y install curl-devel
# R_LIBS might be needed for package dependencies
export R_LIBS=${PKGROOT}/local/lib
mkdir -p ${R_LIBS}

export PATH=${CONFIG_PATH}:${PATH}
export LD_LIBRARY_PATH=${BUILD_PATH}/build-gdal/lib:${BUILD_PATH}/build-proj/lib:${LD_LIBRARY_PATH}:${BUILD_PATH}/build-geos/lib:$LD_LIBRARY_PATH

${PKGROOT}/bin/R --vanilla << END
# Specify where to pull package source from
repos <- getOption("repos")
repos["CRAN"] = "${CRANURL}"
options(repos = repos)
localPackages <- c(
  'rgeos'
)
for (package in localPackages) {
  install.packages(package, lib="${R_LIBS}")
}
END

# Specify where to pull package source from
/opt/R/bin/R CMD INSTALL --configure-args="--with-gdal-config=${CONFIG_PATH}/gdal-config --with-proj-include=${BUILD_PATH}/build-proj/include --with-proj-lib=${BUILD_PATH}/build-proj/lib --with-proj-share=${BUILD_PATH}/build-proj/share/proj" rgdal_${RGDAL_VERSION}.tar.gz -l /opt/R/local/lib
