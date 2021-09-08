African Elephant Red List Assessment (data)  <img src='african-elephant.jpg' align="right" height="120" />
===========================================
[![Build Status](https://app.travis-ci.com/cttedwards/redData.svg?token=oxZdiRsNesp8jgJE5pF3&branch=master)](https://app.travis-ci.com/cttedwards/redData)

The `redData` R-package contains the data and cleaning scripts to accompany the `red` [package](https://github.com/cttedwards/red).

## Installation
This package has been built using `R >= 4.1.0`. To install the package we recommend using the following command:

`R> remotes::install_github('cttedwards/redData', build_vignettes = TRUE, dependencies = TRUE)`

## Data and preparation scripts
Data preparation scripts are available from the package vignette:
`R> vignette("inputs_rla", package = "redData")`

Cleaned data from the [African Elephant Database](http://africanelephantdatabase.org/) are available using:
`R> data("AED", package = "redData")`

