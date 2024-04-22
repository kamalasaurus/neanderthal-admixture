# Neanderthal Admixture

This project collects all the assets to run [hmmix](https://github.com/LauritsSkov/Introgression-detection) by Laurits Skov for archaic hominin detection in human Whole Genome Sequences mapped to the hg38 reference genome.  The tool is able to detect introgression in arbitrary species, but this deployment aims to specifically work with humans.

## Install Singularity-CE
Singularity/Apptainer is a secure containerization environment preferred by most HPC Clusters.  It's similar to docker, but runs securely by default.  There are containers to run on both amd64 and aarch64.  The software doesn't require an HPC to run, it can execute on a laptop.

### Linux
If you are in an HPC environment, singularity will already be installed, and you can skip this part.

```
# for rocky linux
sudo dnf install epel-release
sudo dnf install singularity-ce
```

### For Debian derived Linuces, MacOS, Windows, etc
Follow the instructions here [Install SingularityCE](https://docs.sylabs.io/guides/latest/admin-guide/installation.html)

#### MacOS Apple Silicon
You can also install a virtualized Linux container to run Singularity (a container to hold your container).  This is a failure of the philosophy of containerization, certainly.  It seems Singularity is not quite as widely supported as Docker for multi-platform runtimes.  The official approach might work with the latest version of SingularityCE.

Follow the instructions here [SingularityCE on Apple Silicon](https://sylabs.io/2023/03/installing-singularityce-on-macos-with-apple-silicon-using-utm-rocky/)

To get your instance to run, eject the CD from the UTM interface after installation.  Then right-click the install, and click `edit`.  After that, move `virtl` above `USB` in the drive boot order, and then edit your network settings as per [SSH into UTM image](https://medium.com/@lizrice/linux-vms-on-an-m1-based-mac-with-vscode-and-utm-d73e7cb06133).

Once that's setup, boot your linux image and then:

```
ssh -p 2200 <user>@localhost
```

Now you will have a shell window into your virtual Linux environment from your native terminal.

More general documentation on UTM can be found [here](https://docs.getutm.app/settings-qemu/devices/network/port-forwarding/).

## Download Singularity Container
Deployment pending on storage availability.  In the mean time, you can just download it from this google drive:

### amd64:
[neanderthal-admixture-amd64.sif](https://drive.google.com/file/d/1F8VQ3gEr2A0ksfnGUjiuHRUKKd2aQb5r/view?usp=sharing)

### aarch64:
[neanderthal-admixture-aarch64.sif](https://drive.google.com/file/d/13QbDPJXe9AFMBT1px1TZCupKnuXGdn_6/view?usp=sharing)

## Usage
Rename your download to `neanderthal-admixture.sif` and recreate this folder structure adjacent to the container you've downloaded:

```
.
├── input
│   └── whole-genome.vcf
└── neanderthal-admixture.sif
```

Meaning, create an `input` folder, and then inside the folder copy your whole genome sequence from Nebula or another WGS provider.  Then invoke the following incantation:

```
singularity run --bind ./input:/data neanderthal-admixture.sif
```

Now, sit back and let it run!  Once it's finished you can find the output inside the input folder.

```
cd input/output
```

The files inside are the relevant artifacts that describe your neanderthal introgression.  Specifically, `whole-genome.deoded.diploid.txt` will be the annotated list of regions of introgression by probability given 4 different archaic genomes.

If you have RStudio installed locally, you can run the attached `Neanderthal.Rmd` file to get some cool visualizations and to calculate your total archaic hominin percents.  Notably:  the chromosome maps are very compressed (100s of millions of basepairs spread over 300 or so pixels), so it will look like theres a lot more introgression than the number states.

## Build Container
If you want to build your own container (unnecessary if you just want to run it), all you need is the `neanderthal-admixture.def` file, singularity installed on your machine, and write permissions in the file system.  If you want to do this on Mac, you'll have to do it in that virtualized Linux environment from earlier (you'll have to `scp -P 2020 neanderthal-admixture.def user@localhost` into the virtual environment to use it).

```
sudo singularity build neanderthal-admixture.sif neanderthal-admixture.def
```

The downloads are large, hopefully the links to the assets remain evergreen!