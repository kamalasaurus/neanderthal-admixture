# Neanderthal Admixture

This project collects all the assets to run [hmmix](https://github.com/LauritsSkov/Introgression-detection) by Laurits Skov for archaic hominin detection in human Whole Genome Sequences mapped to the hg38 reference genome.  The tool is able to detect introgression in arbitrary species, but this deployment aims to specifically work with humans.

## Install Singularity-CE
Singularity/Apptainer is a secure containerization environment preferred by most HPC Clusters.  It's similar to docker, but runs securely by default.  There are containers to run on both x64 and aarch64.  The software doesn't require an HPC to run, it can execute on a laptop.

For Linux:
```
# for alpine linux
sudo dnf install singularity-ce
# for debian derived linuces
apt install singularlity-ce
```

For MacOS:
```
brew install singularity
```

## Download Singularity Container


## Usage
Recreate this folder structure adjacent to the container you've downloaded:

```
.
├── input
│   └── whole-genome.vcf
└── neanderthal-admixture.sif
```

Meaning, create an input folder, and then inside the folder copy your whole genome sequence from Nebula or another WGS provider.  Then invoke the following incantation:

```
singularity run --bind ./input:/data neanderthal-admixture.sif
```

Now, sit back and let it run!  Once it's finished you can find the output inside the input folder.

```
cd input/output
```

The files inside are the relevant artifacts that describe your neanderthal introgression.  Specifically, `whole-genome.deoded.diploid.txt` will be the annotated list of regions of introgression by probability given 4 different archaic genomes.

If you have RStudio installed locally, you can run the attached `.Rmd` file to get some cool visualizations and to calculate your total archaic hominin percents.  Notably:  the chromosome maps are very compressed (100s of millions of basepairs spread over 300 or so pixels), so it will look like theres a lot more introgression than the number states.