#' Glasser Multi-Modal Cortical Parcellation (HCP)
#'
#' Brain atlas for the Glasser cortical parcellation with 361 regions
#' based on the Human Connectome Project multi-modal parcellation.
#' Contains 2D polygon geometry for [ggseg::geom_brain()].
#'
#' @family ggseg_atlases
#'
#' @references Glasser MF, Coalson TS, Robinson EC, Hacker CD, Harwell J,
#'   Yacoub E, Ugurbil K, Andersson J, Beckmann CF, Jenkinson M, Smith SM,
#'   Van Essen DC (2016). A multi-modal parcellation of human cerebral cortex.
#'   *Nature*, 536(7615):171-178.
#'   \doi{10.1038/nature18933}
#'
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @export
#' @examples
#' glasser()
glasser <- function() .glasser
