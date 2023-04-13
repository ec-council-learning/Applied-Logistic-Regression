# Applied Logistic Regression

This is the code repository for the EC-Council course **Applied Logistic Regression:  A Data-Driven Approach to Classification**.

There are two ways to run this code:  use the provided Dockerfile to build a container, or run the notebooks yourself.  The strong recommendation is to build a Docker container.

## Running in a Container

To build the container, run the following command in the the console.  Make sure you are in the directory where you cloned this repository:

`docker build -t logistic-regression .`

This will build a container image called `logistic-regression`.  Once you have built the container image, run the following to create a container:

`docker run -p 8888:8888 -e ENABLE_JUPYTER_LAB=YES logistic-regression`

When you run this, you will get a prompt to go to a URL at https://127.0.0.1:8888.  Click the link in the console to open a browser tab to Jupyter.  Please note that you will need the access token that the URL includes.

All of the packages we will need are pre-installed, and all of the datasets are already available inside the container, so you will not need to add anything else.

## Running on Your Own

In order to run these notebooks, you will need the [Anaconda distribution of Python](https://www.anaconda.com/products/distribution) installed.  Then, run the following commands to ensure that the R programming language and relevant R libraries are installed.

```sh
conda install --quiet --yes \
    'r-base' \
	'r-e1071' \
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
	'r-foreign'
```

Note that you might need to alter this command slightly to run on Windows.

Once all of the packages are installed, you can 