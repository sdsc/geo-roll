#!/usr/bin/perl -w
# geo roll installation test.  Usage:
# geo.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my @PACKAGES = ('gdal', 'geos', 'proj');
my @RMODULES = ('rgdal', 'rgeos', 'gstat', 'RSAGA', 'spacetime');
my $isCompute = $appliance eq 'Compute';
my $isFe = $appliance eq 'Frontend';
my $isLogin = $appliance eq 'Login';
my $output;

my $TESTFILE = "tmpgeo";

# geo-common.xml
foreach my $package(@PACKAGES) {
  if($appliance =~ /$installedOnAppliancesPattern/) {
    ok(-d "/opt/$package", "$package is installed");
  } else {
    ok(! -d "/opt/$package", "$package is not installed");
  }
}

open(OUT, ">${TESTFILE}gdal.c");
print OUT <<END;
#include "gdal.h"
#include "cpl_conv.h"
#include <stdio.h>

int main() {
  GDALAllRegister();
  printf("GDALAllRegister worked\\n");
  return 0;
}
END
close(OUT);

open(OUT, ">${TESTFILE}gdal.sh");
print OUT <<END;
#!/bin/bash
module load ROLLCOMPILER gdal
gcc -I /opt/gdal/include -L /opt/gdal/lib -lgdal -o ${TESTFILE}gdal.exe ${TESTFILE}gdal.c
./${TESTFILE}gdal.exe
END
close(OUT);

SKIP: {
  skip 'gdal not installed', 1 if ! -d '/opt/gdal';
  $output = `/bin/bash ${TESTFILE}gdal.sh 2>&1`;
  like($output, qr/worked/, 'gdal library works');
} 

open(OUT, ">${TESTFILE}geos.cpp");
print OUT <<END;
#include <iostream>
#include <geos/geom/Geometry.h>
using namespace std;
using namespace geos::geom;
int main() {
  cout<<"GEOS "<<geosversion()<<" ported from JTS "<<jtsport()<<endl;
  return 0;
}
END
close(OUT);

open(OUT, ">${TESTFILE}geos.sh");
print OUT <<END;
#!/bin/bash
module load ROLLCOMPILER geos
g++ -I /opt/geos/include -L /opt/geos/lib -lgeos -o ${TESTFILE}geos.exe ${TESTFILE}geos.cpp
./${TESTFILE}geos.exe
END
close(OUT);

SKIP: {
  skip 'geos not installed', 1 if ! -d '/opt/geos';
  $output = `/bin/bash ${TESTFILE}geos.sh 2>&1`;
  like($output, qr/ported from/, 'geos library works');
} 

open(OUT, ">${TESTFILE}proj.sh");
print OUT <<END;
#!/bin/bash
module load proj
echo 10 45 | proj +proj=poly +ellps=clrk66
END
close(OUT);

SKIP: {
  skip 'proj not installed', 1 if ! -d '/opt/proj';
  $output = `/bin/bash ${TESTFILE}proj.sh 2>&1`;
  like($output, qr/^\d+(\.\d+)?\s+\d+(\.\d+)?$/, 'proj works');
} 

SKIP: {

  foreach my $package(@PACKAGES) {
    `/bin/ls /opt/modulefiles/applications/$package/[0-9]* 2>&1`;
    ok($? == 0, "$package module installed");
    `/bin/ls /opt/modulefiles/applications/$package/.version.[0-9]* 2>&1`;
    ok($? == 0, "package version module installed");
    ok(-l "/opt/modulefiles/applications/$package/.version",
       "$package version module link created");
  } 

} 

SKIP: {
  skip 'R not installed', int(@RMODULES) + 1 if ! -d '/opt/R';
  $ENV{'R_LIBS'} = '/opt/R/local/lib';
  ok(-d $ENV{'R_LIBS'}, 'R library created');
  foreach my $module(@RMODULES) {
    $output = `module load R gdal geos proj; /bin/echo "require($module, lib.loc='/opt/R/local/lib');(.packages())" | R --vanilla 2>&1`;
    like($output, qr/"$module"/, "$module R module loads");
  }
}

`/bin/rm -fr $TESTFILE*`;
