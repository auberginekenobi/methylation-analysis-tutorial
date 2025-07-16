# 1. Installation
You can run this tutorial on the cloud with just an internet connection, or you can install all software to your own computer. Section 1 gives setup instructions specific to your platfom of choice; it is recommended that beginners choose the GenePattern Notebook option to simplify setup. Steps in section 2 should work on all platforms, but pay attention to the footnotes for OS-specific differences if you're running locally[^1].

## 1.1. Platform-specific setup
## 1.1.0. GenePattern Notebook cloud platform
GenePattern Notebook (GPN) is a cloud bioinformatics resource developed and maintained by the Mesirov lab at UCSD. It is designed for use by computational experts and newbies alike, and provides compute resources, a standard Linux operating system (OS), the programming languages `python` and `R`, the version control software `git`, the *package manager* `conda`, and the interactive software development tool `jupyter notebook`. 
- Navigate to [GenePattern Notebook](https://notebook.genepattern.org/) and create an account.
- Create a new project "methylation-analysis-demo". This will open a new tab with the GPN user interface (UI), and would be equivalent to opening a terminal and running `jupyter notebook` on a fresh Linux box with `python`, `R`, `git`, and `jupyter` installed.
![screenshot](gpnui_empty.png)
### 1.1.1. Local install (Linux & Mac OS)
- Follow instructions to install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
- Follow instructions to install the [miniforge distribution of conda](https://github.com/conda-forge/miniforge). Proceed through installation prompts, and accept the prompt to update your shell profile to automatially initialize conda. 
- Install jupyter: `conda install -n base jupyterlab`.
### 1.1.2. Local install (Windows)
Many bioinformatics softwares are not compiled for Windows. To solve this issue, Microsoft maintains the [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) project. Install WSL, then follow the Linux instructions above.

## 1.2. Install dependencies
Most bioinformatics analyses use existing software written and distributed by someone else, called *packages*. Those packages in turn will require other third-party packages to run, called *dependencies*, which will in turn require more dependencies, etc. This tutorial uses the `minfi` package to analyze Illumina methylation array data, but the entire *dependency tree* is about 266 different software packages, each with specific versions. We will use the `conda` *package manager* to install these.
- In the top right hand corner of the interface, click `New` > `Terminal`. This will open a bash command line interface (CLI), which you can use to download resources and install software.[^2]
- **Download the code.** Git is a software for maintaining and distributing other software. Run the command `git clone https://github.com/auberginekenobi/methylation-analysis-tutorial.git` on the CLI to download the code for this tutorial.
- **Set up your environment.** A *virtual environment* (VE) is an isolated set of software tools for running a particular task. We will create a virtual environment for all of the software required for methylation analysis using `conda`.
- The softwares required for this tutorial are listed in the `environment.yml` file of this repository. Run `conda env create --prefix=~/.conda/methylation --file=methylation-analysis-tutorial/environment.yml`[^3][^4] to create the VE and install all dependencies. **This will take awhile to run.**
- Run `conda init; source ~/.bashrc`; the reason this is necessary is beyond scope of this tutorial. Briefly, if you don't run this, then `conda` will tell you to run this before you can run the next command.
- Run `conda activate ~/.conda/methylation` to enter your new VE.
- Run `R -e 'IRkernel::installspec(name = "methylation", displayname = "methylation")'`. This will make your environment accessible within GenePattern Notebook.


[^1]: Footnotes indicate differences between setup on GPN vs. a local machine with Linux, git, conda etc. installed.
[^2]: On Mac OS, the CLI is the 'Terminal' app. On Windows, this is the 'WSL' app you installed in Section 1. For Linux, the name of the CLI probably varies by distro, but if you're running Linux we assume you already know how to acces the CLI.
[^3]: The `--prefix` flag is required on GPN because only the user directory is persisted between sessions. If running locally, the `--prefix` flag is not necessary.
[^4]: If installing locally on Apple Silicon you'll need to specify that you want to use packages compiled for Intel architecture: `CONDA_SUBDIR=osx-64 conda env create --file=methylation-analysis-tutorial/_environment.yml`