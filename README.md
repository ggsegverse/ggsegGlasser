

<!-- README.md is generated from README.qmd. Please edit that file -->

# ggsegGlasser <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ggsegverse/ggsegGlasser/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegGlasser/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggseg.r-universe.dev/badges/ggsegGlasser.png)](https://ggseg.r-universe.dev/ggsegGlasser)
<!-- badges: end -->

This package contains the Glasser HCP multimodal parcellation atlas for
ggseg.

Glasser MF, Coalson TS, Robinson EC, Hacker CD, Harwell J, Yacoub E,
Ugurbil K, Andersson J, Beckmann CF, Jenkinson M, Smith SM, & Van Essen
DC (2016). A multi-modal parcellation of human cerebral cortex.
*Nature*, 536, 171-178.

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggseg.r-universe.dev/ui#builds):

``` r
options(repos = c(
  ggseg = "https://ggseg.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))

install.packages("ggsegGlasser")
```

You can install this package from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ggsegverse/ggsegGlasser")
```

## Glasser atlas

``` r
library(ggseg)
library(ggsegGlasser)

plot(glasser())
```

<img src="man/figures/README-glasser-1.png" style="width:100.0%" />

## Data source

Glasser MF, Coalson TS, Robinson EC, Hacker CD, Harwell J, Yacoub E,
Ugurbil K, Andersson J, Beckmann CF, Jenkinson M, Smith SM, & Van Essen
DC (2016). A multi-modal parcellation of human cerebral cortex.
*Nature*, 536, 171-178.
