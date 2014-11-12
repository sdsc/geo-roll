## Overview

This roll bundles the GEOS geometry engine, GDAL (Geospatial Data Abstraction Library) , and PROJ (Cartographic Projections Library) as well as as the R interfaces to geos (rgeos) and gdal (rgdal).

For more information about GEOS,GDAL and PROJ please visit the official web pages:

- <a href="http://trac.osgeo.org/geos/" target="_blank">GEOS</a> is a  C++ port
of the <a href="http://tsusiatsoftware.net/jts/main.html" target="_blank">Java
Topology Suite</a> (JTS).
- <a href="http://www.gdal.org/" target="_blank">GDAL</a> is a translator library
for raster geospatial data formats
- <a href="http://trac.osgeo.org/proj/" target="_blank">PROJ</a> converts geographic longitude and latitude coordinates into cartesian coordinates

## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate geo source file(s) using a machine that does
have Internet access and copy them into the `src/geos` directory on your
Rocks development machine.


## Dependencies

R must be installed and a modulefile for it must be available.  The R-roll
provides this.


## Building

To build the geo-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `geo-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll geo
% cd /export/rocks/install
% rocks create distro
% rocks run roll geo | bash
```

In addition to the software itself, the roll installs geo environment
module files in:

```shell
/opt/modulefiles/applications/geo

## Testing

The geo-roll includes a test script which can be run to verify proper
installation of the roll binaries and module files. To run the test scripts
execute the following command(s):

```shell
% /root/rolltests/geo.t 
```

