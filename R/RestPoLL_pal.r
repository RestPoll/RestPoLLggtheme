#' Shows the PoMS Palette Colours
#'
#' Show the colours with the Hex colour names of the given palette.
#' @param palette One of the PoMS colour palettes: "main", "secondary", "both", "dark", "grey", or "all".
#'
#' @importFrom graphics image text
#'
#' @return A colour map with respective Hex names
#' @export
#'
#' @examples
#' PoMS_pal(palette = "main")
#'
RestPoLL_pal <- function(palette = "both") {

    name <-  restpoll_palettes[[palette]]

    image(1:length(name), 1, as.matrix(1:length(name)), col = name,
          xlab = paste("The ",palette, " palett colours"), ylab = "", xaxt = "n",
          yaxt = "n", bty = "n")
    text(name, x = 1:length(name), y = 1, cex = 1)

}
