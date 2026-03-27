# ggsegGlasser

<!-- badges: start -->
[![R-CMD-check](https://github.com/ggsegverse/ggsegGlasser/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegGlasser/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggsegverse.r-universe.dev/badges/ggsegGlasser)](https://ggsegverse.r-universe.dev/ggsegGlasser)
<!-- badges: end -->

Glasser Atlas for the ggsegverse Ecosystem.

## Installation

``` r
# From r-universe
install.packages("ggsegGlasser", repos = "https://ggsegverse.r-universe.dev")

# From GitHub
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegGlasser")
```

## Usage

``` r
library(ggsegGlasser)
library(ggseg)

plot(glasser()) +
  theme_brain()
```

## Atlas

### glasser

HCP Multi-Modal Parcellation with 180 regions per hemisphere (Glasser et al., 2016).

![glasser](man/figures/glasser_snapshot.png)
