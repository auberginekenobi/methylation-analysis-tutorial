# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/rstudio-notebook:stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

COPY install.R /tmp

### CONDA

RUN conda install nb_conda_kernels
ARG KERNEL=methylation-analysis-tutorial
ENV CONDA_PREFIX=/opt/conda/envs/${KERNEL}

COPY _environment.yml /tmp
RUN conda env create --file /tmp/_environment.yml && \
    eval "$(conda shell.bash hook)" && \
    conda activate ${KERNEL} && \
    mkdir -p $CONDA_PREFIX/etc/conda/activate.d && \
    python -m ipykernel install --name=${KERNEL} && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER



#RUN apt-get -y install htop
#RUN Rscript /tmp/install.R

#RUN R -e "install.packages('rjson', repos='http://cran.rstudio.com/')" && \
#    R -e "install.packages('session', repos='http://cran.rstudio.com/')" && \
#    R -e "install.packages('rmarkdown', repos='http://cran.rstudio.com/')"

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

#RUN pip install --no-cache-dir networkx scipy

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
