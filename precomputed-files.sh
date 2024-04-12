#!/bin/bash

cd /opt

mkdir precomputed-files
wget https://zenodo.org/api/records/10806733/files-archive
unzip files-archive -d precomputed-files
rm files-archive
