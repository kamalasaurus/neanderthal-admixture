#!/bin/sh

wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/analysisSet/hg38.analysisSet.chroms.tar.gz
tar -xvzf hg38.analysisSet.chroms.tar.gz
rm hg38.analysisSet.chroms.tar.gz
mv hg38.analysisSet.chroms hg38-reference

cd hg38-reference
mkdir scaffold
mv *_* scaffold
mv *EBV* scaffold
mv *M* scaffold
cd ..

#for i in *; do bcftools view $i -l 1 -O b > ${i::-4}.bcf ; done;
#for i in *.bcf; do bcftools index $i; done;