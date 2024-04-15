#!/bin/bash

apt update -y
apt upgrade -y
apt install zip unzip gzip tar -y

conda update -n base conda -y && conda clean --all --yes && conda install pip -y
conda install vcftools bcftools --channel conda-forge --channel bioconda
pip install hmmix

cd /opt

git clone https://github.com/kamalasaurus/Introgression-detection.git
