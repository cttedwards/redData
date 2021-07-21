# Makefile for generating the stanUtils R package
#
PKG_VERSION=$(shell grep -i ^version DESCRIPTION | cut -d : -d \  -f 2)
PKG_NAME=$(shell grep -i ^package DESCRIPTION | cut -d : -d \  -f 2)
R_FILES := $(wildcard R/*.R)
PKG_FILES := DESCRIPTION NAMESPACE $(R_FILES)

ifeq ($(OS),Windows_NT) 
	RM = rm -rf
	CP = cp -f
	CD = cd
else
	RM = rm -rf
	CP = cp -f
	CD = cd
endif

all: install clean

./inst/doc/*.html: ./vignettes/*.Rmd
	$(CD) data-raw; Rscript make_data.R
	$(CD) vignettes; Rcmd Sweave inputs_rla.Rmd; Rcmd Sweave inputs_ms.Rmd
	$(CP) ./vignettes/*.html ./inst/doc/
    
install: $(PKG_FILES) ./inst/doc/*.html
	Rcmd build --no-build-vignettes .
	Rcmd INSTALL $(PKG_NAME)_*.tar.gz
	
DESCRIPTION NAMESPACE: $(R_FILES)
	Rscript version_update.R

clean:
	$(RM) $(PKG_NAME)_*.zip
	$(RM) $(PKG_NAME)_*.tar.gz
	$(RM) man/
	$(RM) vignettes/*.html
	$(RM) vignettes/*.R
