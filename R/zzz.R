
#' Load Fonts For the R Session
#'
#' Attach the installed fonts for this R session for the win and pdf devices.
#'
#' @param libname Not used
#' @param pkgname Not used
#' @import extrafont
#' @import grDevices
#'
#' @return Load fonts for widows device and pdf device
#'
.onAttach <- function(libname, pkgname) {
    packageStartupMessage("Loading RestPoLLggtheme version: ", getNamespaceVersion('RestPoLLggtheme'), "\n\nLoading available fonts for this session.\n\nYou can install fonts from this package with:\n 'import_fonts()' - Arial, Times New Roman, and Lora\n\nYou can use them with e.g:\n theme_RestPoLL(base_family = 'Arial', title_family = 'Lora')")
}

.onLoad <- function(libname, pkgname) {
    extrafont::loadfonts(device = "pdf", quiet = TRUE)
    extrafont::loadfonts(device = "postscript", quiet = TRUE)

    if (.Platform$OS.type == "windows") {
        extrafont::loadfonts(device = "win", quiet = TRUE)
    } else {

    }


}
