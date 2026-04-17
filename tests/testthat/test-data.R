library(ggplot2)
library(ggseg)
library(ggseg3d)

describe("glasser atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(glasser(), "ggseg_atlas")
    expect_s3_class(glasser(), "cortical_atlas")
  })

  it("is valid", {
    expect_true(ggseg.formats::is_ggseg_atlas(glasser()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    skip_if_not_installed("vdiffr")
    p <- ggplot() +
      geom_brain(
        atlas = glasser(),
        mapping = aes(fill = label),
        position = position_brain(hemi ~ view),
        show.legend = FALSE
      ) +
      scale_fill_manual(values = glasser()$palette, na.value = "grey") +
      theme_void()
    vdiffr::expect_doppelganger("glasser-2d", p)
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d(atlas = glasser())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})
