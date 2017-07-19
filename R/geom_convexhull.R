StatConvexHull <- ggplot2::ggproto(
  "StatConvexHull",
  ggplot2::Stat,
  required_aes = c("x", "y"),
  compute_group = function(self, data, scales, params) {
    data[chull(data$x, data$y), ]
  }
)

stat_convexhull <- function(mapping = NULL, data = NULL, geom = "polygon",
                            position = "identity", show.legend = NA,
                            inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatConvexHull,
    data = data, mapping = mapping, geom = geom, position = position,
    show.legend = show.legend, inherit.aes = inherit.aes, params = list(...)
  )
}

#' Convex hull geom for ggplot2
#'
#' Convex hull are very similar to polygons (as drawn by geom_polygon) except
#' that only points forming the outside contour are connected by the shape.
#' This function is only a wrapper around R's original chull function
#'
#' @seealso \code{\link[ggplot2]{geom_polygon}}, \code{\link{chull}}
#' @inheritParams ggplot2::geom_polygon
#' @export
#' @examples
#' n <- 10
#' test_df <- data.frame(
#'   a = runif(n),
#'   b = runif(n)
#' )
#'
#' library(ggplot2)
#' ggplot(test_df, aes(x = a,y = b)) +
#'   geom_point() +
#'   geom_convexhull(alpha = 0.7, fill = "red")
#'

geom_convexhull <- function (mapping = NULL, data = NULL, stat = "convex_hull", position = "identity",
                             ..., na.rm = FALSE, show.legend = NA, inherit.aes = TRUE) {
  ggplot2::layer(
    data = data, mapping = mapping, stat = stat, geom = ggplot2::GeomPolygon,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
