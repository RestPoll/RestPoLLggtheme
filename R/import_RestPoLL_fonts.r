
#' Import Times New Roman and Arial fonts for use in charts
#'
#' These fonts are used when the AGaramondPro and FrutigerLTStd are not possible
#' to use.
#' @import extrafont
#' @import grDevices
#' @md
#' @note You will need to load the fonts aswell with extrafont::loadfonts(),
#'   this is done automatically when using the save_poms_plot().This will take care of ensuring PDF/PostScript usage. The location of
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
