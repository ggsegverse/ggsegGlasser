# Glasser Multi-Modal Cortical Parcellation (HCP)

Brain atlas for the Glasser cortical parcellation with 361 regions based
on the Human Connectome Project multi-modal parcellation. Contains 2D
polygon geometry for
[`ggseg::geom_brain()`](https://ggsegverse.github.io/ggseg/reference/ggbrain.html).

## Usage

``` r
glasser()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (cortical).

## References

Glasser MF, Coalson TS, Robinson EC, Hacker CD, Harwell J, Yacoub E,
Ugurbil K, Andersson J, Beckmann CF, Jenkinson M, Smith SM, Van Essen DC
(2016). A multi-modal parcellation of human cerebral cortex. *Nature*,
536(7615):171-178.
[doi:10.1038/nature18933](https://doi.org/10.1038/nature18933)

## Examples

``` r
glasser()
#> 
#> ── glasser ggseg atlas ─────────────────────────────────────────────────────────
#> Type: cortical
#> Regions: 180
#> Hemispheres: left, right
#> Views: inferior, lateral, superior, medial
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi region        label
#> 1  left     V1  lh_L_V1_ROI
#> 2  left    MST lh_L_MST_ROI
#> 3  left     V6  lh_L_V6_ROI
#> 4  left     V2  lh_L_V2_ROI
#> 5  left     V3  lh_L_V3_ROI
#> 6  left     V4  lh_L_V4_ROI
#> 7  left     V8  lh_L_V8_ROI
#> 8  left      4   lh_L_4_ROI
#> 9  left     3b  lh_L_3b_ROI
#> 10 left    FEF lh_L_FEF_ROI
#> ... with 350 more rows
plot(glasser())
```
