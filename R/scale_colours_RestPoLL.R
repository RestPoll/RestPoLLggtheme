
## Set the PoMS colours
restpoll_colours <- c(
  "br" = "#4f2b17",
  "lightbr" = "#805921",
  "or" = "#e87321",
  "lightor" = "#f7b01c",
  "yell" = "#ffd63d"
)

#' Function to extract Lund university colours as hex codes
#'
#' @param ... Character names of Lu_colours
#'
restpoll_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(restpoll_colours)

  restpoll_colours[cols]
}


restpoll_palettes <- list(
  `main` = restpoll_cols("br", "lightbr"),
  `secondary` = restpoll_cols("or", "lightor", "yell"),
  `both` = restpoll_cols("br", "lightbr", "or", "lightor", "yell")
  # `grey` = LU_cols("grey", "dark", "stone50", "dark50", "stone25", "dark25"),
  # `dark` = LU_cols("blue", "red", "dark"),
  # `all` = LU_cols("blue", "red", "skyblue", "orange", "vermillion", "turquoise", "reddish", "yellow", "purple", "green", "grey", "dark")
)


#' Return function to interpolate a RestPoLL colour palette
#'
#' @param palette Character name of palette in LU_palettes ("main", "secondary",
#'   "both").
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments to pass to colorRampPalette().
#' @import grDevices
#'
restpoll_pals <- function(palette = "both", reverse = FALSE, ...) {
  pal <- restpoll_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)

}


#' Color Scale Constructor for RestPoLL Colors
#'
#' @param palette Character name of palette in RestPoLL palettes ("main", "secondary",
#'   "both"). Show colours of the palettes with `RestPoLL_pal()`.
#' @param discrete Boolean indicating whether color aesthetic is discrete or
#'   not.
#' @param reverse Boolean indicating whether the palette should be reversed.
#' @param ... Additional arguments passed to discrete_scale() or
#'   scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @import ggplot2
#' @details The palette is made up of the different colors from the graphical profile of
#'   the RestPoLL project. The choices are:
#' \itemize{
#'    \item main - the main blue and bronze colours (can be used for first and secondary headings).
#'    \item secondary - the colours that are not main or grey.
#'    \item both - both the main and secondary colours.
#'  }
#' @export
scale_colour_RestPoLL <- function(palette = "secondary", discrete = TRUE, reverse = FALSE, ...) {
  pal <- restpoll_pals(palette = palette, reverse = reverse)
  #pal <- LU_palettes[[palette]]

  #if (reverse) pal <- rev(pal)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("restpoll_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill Scale constructor for RestPoLL Colours
#'
#' @inheritParams scale_colour_RestPoLL
#' @param ... Additional arguments passed to discrete_scale() or
#'   scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE.
#' @import ggplot2
#' @export
#'
scale_fill_RestPoLL <- function(palette = "secondary", discrete = TRUE, reverse = FALSE, ...) {
  pal <- restpoll_pals(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("restpoll_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
