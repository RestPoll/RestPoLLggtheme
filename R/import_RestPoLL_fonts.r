
#' Import Times New Roman, Arial, and Lora fonts for use in charts
#'
#' These default fonts are Arial, however the Lora font is the recomended font for RestPoLL.
#' @import extrafont
#' @import grDevices
#' @md
#' @note You should not need to load the fonts (e.g. with `extrafont::loadfonts()`).
#'   This should be done with the `showtext` package. The location of
#'   the font directory is displayed after the base import is complete. It is
#'   highly recommended that you install them on your system the same way you
#'   would any other font you wish to use in other programs.
#' @export
import_fonts <- function() {

    times_font_dir <- system.file("fonts", "times", package = "RestPoLLggtheme")

    suppressWarnings(suppressMessages(extrafont::font_import(times_font_dir, prompt = FALSE)))


    arial_font_dir <- system.file("fonts", "arial", package = "RestPoLLggtheme")

    suppressWarnings(suppressMessages(extrafont::font_import(arial_font_dir, prompt = FALSE)))

    lora_font_dir <- system.file("fonts", "lora", package = "RestPoLLggtheme")

    suppressWarnings(suppressMessages(extrafont::font_import(lora_font_dir, prompt = FALSE)))

    message(
        sprintf("\nThe fonts Times New Roman, Arial, and Lora is installed for R.\nYou will likely need to install these fonts on your system as well.\n\nYou can find the fonts in:\n [%s],\n [%s]\n and:\n[%s]",
            times_font_dir, arial_font_dir, lora_font_dir)
    )

}
