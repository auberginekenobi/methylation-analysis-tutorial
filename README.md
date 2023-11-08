# Analysis of methylation data with minfi and conumee

[![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/chavez-lab/methylation-analysis-tutorial/HEAD?filepath=methylation.ipynb)

## Dependencies
- [R](https://www.r-project.org/)
- [minfi](https://bioconductor.org/packages/devel/bioc/vignettes/minfi/inst/doc/minfi.html)
- [conumee](https://bioconductor.org/packages/devel/bioc/vignettes/conumee/inst/doc/conumee.html)
- [jupyter lab](https://jupyter.org/try-jupyter/lab/?path=notebooks%2FIntro.ipynb)

## Installation
1. Install dependencies 
2. Run methylation.ipynb

## Todo
- Deploy code, data and environment somewhere to the cloud (binder? SDSC accounts? genepattern 
notebook? posit cloud?)

## Lab notebook
2023 course materials: https://www.dropbox.com/scl/fo/ikec8fs2xovk0onljsyd2/h?dl=0

Things I have learned so far:
- To set up your virtual environment with jupyter lab, see 
https://www.zainrizvi.io/blog/jupyter-notebooks-best-practices-use-virtual-environments/
- Lots of bioconda packages will will only build on intel cpus. If you are using conda and 
apple silicon, see 
https://stackoverflow.com/questions/71515117/how-to-set-up-a-conda-osx-64-environment-on-arm-mac
- Using conda to install R packages (minfi and conumee + dependencies) seems to exceed the 
RAM limit for [mybinder.org](mybinder.org). See 
https://discourse.jupyter.org/t/how-can-i-prevent-an-out-of-memory-error-in-github-actions/17294

