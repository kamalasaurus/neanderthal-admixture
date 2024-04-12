#!/bin/sh

wget ftp://ftp.ensembl.org/pub/release-111/fasta/ancestral_alleles/homo_sapiens_ancestor_GRCh38.tar.gz
tar -xvzf homo_sapiens_ancestor_GRCh38.tar.gz
rm homo_sapiens_ancestor_GRCh38.tar.gz
mv homo_sapiens_ancestor_GRCh38 hg38-ancestral

cd hg38-ancestral
for i in *.bed; do sed -i 's/^/chr/' $i; done;
mkdir scaffold
mv *scaffold.* scaffold
mv *MT* scaffold
for i in *.fa; do mv -n $i chr`echo $i | cut -d"_" -f 4`; done;
for i in *.bed; do mv -n $i chr`echo $i | cut -d"_" -f 4`; done;
cd ..
