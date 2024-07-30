
#' Load Fonts For the R Session
#'
#' Attach the installed fonts for this R session for the different devices.
#'
#' @param libname Not used
#' @param pkgname Not used
#' @import sysfonts
#' @import grDevices
#' @import showtext
#'
#' @return None. Load fonts for devices.
#'
.onAttach <- function(libname, pkgname) {
    packageStartupMessage("Loading RestPoLLggtheme version: ", getNamespaceVersion('RestPoLLggtheme'), "\n\nLoading available fonts for this session.\n\nYou can install fonts from this package with:\n 'import_fonts()' - Arial, Times New Roman, and Lora\n\nYou can use them with e.g:\n theme_RestPoLL(base_family = 'Arial', title_family = 'Lora')")
}

.onLoad <- function(libname, pkgname) {
    # extrafont::loadfonts(device = "pdf", quiet = TRUE)
    # extrafont::loadfonts(device = "postscript", quiet = TRUE)
    #
    # if (.Platform$OS.type == "windows") {
    #     extrafont::loadfonts(device = "win", quiet = TRUE)
    # } else {
    #
    # }
    #
    #Arial
    sysfonts::font_add(family = "Arial",
                       regular = system.file("fonts", "arial", "Arial.ttf", package = "RestPoLLggtheme"),
                       bold = system.file("fonts", "arial", "Arial_Bold.ttf", package = "RestPoLLggtheme"),
                       italic = system.file("fonts", "arial", "Arial_Italic.ttf", package = "RestPoLLggtheme"))
    #Times
    sysfonts::font_add(family = "Times",
                       regular = system.file("fonts", "times", "Times_New_Roman.ttf", package = "RestPoLLggtheme"),
                       bold = system.file("fonts", "times", "Times_New_Roman_Bold.ttf", package = "RestPoLLggtheme"),
                       italic = system.file("fonts", "times", "Times_New_Roman_Italic.ttf", package = "RestPoLLggtheme"))
    #Lora
    sysfonts::font_add(family = "Lora",
                       regular = system.file("fonts", "lora", "Lora-Regular.ttf", package = "RestPoLLggtheme"),
                       bold = system.file("fonts", "lora", "Lora-Bold.ttf", package = "RestPoLLggtheme"),
                       italic = system.file("fonts", "lora", "Lora-Italic.ttf", package = "RestPoLLggtheme"),
                       bolditalic = system.file("fonts", "lora", "Lora-BoldItalic.ttf", package = "RestPoLLggtheme"))

    showtext::showtext_auto()

}

