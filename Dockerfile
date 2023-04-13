# Adapted from https://github.com/jupyter/docker-stacks/tree/master/r-notebook
ARG BASE_CONTAINER=jupyter/datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Kevin Feasel"

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc && \
    rm -rf /var/lib/apt/lists/*

# Fix for devtools https://github.com/conda-forge/r-devtools-feedstock/issues/4
RUN ln -s /bin/tar /bin/gtar

USER $NB_UID

# R packages
RUN conda install --quiet --yes \
    'r-base' \
    'r-caret' \
    'r-crayon' \
    'r-devtools' \
    'r-forecast' \
    'r-hexbin' \
    'r-htmltools' \
    'r-htmlwidgets' \
    'r-irkernel' \
    'r-rcurl' \
    'r-reshape2' \
    'r-rmarkdown' \
    'r-shiny' \
    'r-tidyverse' \
	'r-mice' \
	'r-foreign' \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR

# Install e1071 R package (dependency of the caret R package)
RUN conda install --quiet --yes r-e1071

# End adaptation from https://github.com/jupyter/docker-stacks/tree/master/r-notebook
# Adding custom content for Logistic Regression demos.

# Include data and notebooks.
ADD notebooks ./notebooks
ADD data ./data

