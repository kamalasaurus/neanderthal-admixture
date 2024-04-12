#!/bin/sh

mkdir hg38-archaic
wget https://zenodo.org/api/records/10806726/files-archive
unzip files-archive -d hg38-archaic
rm files-archive
