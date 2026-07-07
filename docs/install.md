# 1. Installation

This tutorial uses the `jupyter` interface for computational analyses and the `conda` package manager to install required software. You can read more about setting up your workstation for bioinformatics [here](https://github.com/auberginekenobi/protocols/tree/main/0_Setting_up_your_workstation). Follow the instructions below to install on your computer.

## 1.1.1. Local install (Linux & Mac OS)[^1]
- (Optional) follow instructions to install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).[^2]
- Follow instructions to install the [miniforge distribution of conda](https://github.com/conda-forge/miniforge). Proceed through installation prompts, and accept the prompt to update your shell profile to automatially initialize conda.[^3] 
- Install jupyter: `conda install -n base jupyterlab`.
## 1.1.2. Local install (Windows)
Many bioinformatics softwares are not compiled for Windows. To solve this issue, Microsoft maintains the [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) project. Install WSL, then follow the Linux instructions above.

## 1.2. Install dependencies
Most bioinformatics analyses use existing software written and distributed by someone else, called *packages*. Those packages in turn will require other third-party packages to run, called *dependencies*, which will in turn require more dependencies, etc. This tutorial uses the `minfi` package to analyze Illumina methylation array data, but the entire *dependency tree* is about 266 different software packages, each with specific versions. We will use the `conda` *package manager* to install these.
- Open a bash command line interface (CLI). On Linux and Mac OS, this is `Terminal`; on Windows this is WSL (installed in the previous section).
- **Download the code.** Git is a software for maintaining and distributing other software. Run the command `git clone https://github.com/auberginekenobi/methylation-analysis-tutorial.git` on the CLI to download the code for this tutorial.[^2]
- **Set up your environment.** A *virtual environment* (VE) is an isolated set of software tools for running a particular task. We will create a virtual environment for all of the software required for methylation analysis using `conda`.
- The softwares required for this tutorial are listed in the `environment.yml` file of this repository. Run `conda env create --file=methylation-analysis-tutorial/environment.yml`[^4] to create the VE and install all dependencies. **This will take awhile to run.**
- Run `conda activate ~/.conda/methylation` to enter your new VE.
- Run `R -e 'IRkernel::installspec(name = "methylation", displayname = "methylation")'`. This will make your environment accessible within GenePattern Notebook.


[^1]: Previous versions of this tutorial were available on GenePattern; however, the GenePattern project was retired in June 2026 and is no longer available.
[^2]: `git` is recommended but not required for this tutorial. If you choose not to use git, instead download the code for this project [here](https://github.com/auberginekenobi/methylation-analysis-tutorial/archive/refs/heads/main.zip).
[^3]: Detailed instructions for installing conda can be found in steps 1-5 [here](https://github.com/auberginekenobi/protocols/tree/main/0_Setting_up_your_workstation).
[^4]: If installing locally on Apple Silicon you'll need to specify that you want to use packages compiled for Intel architecture: `CONDA_SUBDIR=osx-64 conda env create --file=methylation-analysis-tutorial/_environment.yml`