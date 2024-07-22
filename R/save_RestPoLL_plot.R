
#' Arrange, style and save the ggplot chart
#'
#' Running this function with the plot name as variable will save your plot with
#' some extra styling. It will add Arial as text font except the subtitle, which
#' will be in Times New Roman. It will also left align your title, subtitle and
#' source, add and optional Lund university logo in the top right, and save it to your
#' specified location. Optionally it can add a logo at the bottom right.
#'
#' @usage save_poms_plot(save_filepath = "FigX.png", plot = last_plot(),
#'  source_name = "Source: Lund University", width = 9, height = 6,
#'  logo_image_path = "", LU_logo = "")
#'
#' @param save_filepath Exact file-path that you want the plot to be saved to, or just
#' the name of the file. Default file-path is the working directory
#' @param plot The name of the plot (saved in an object) you have created that you want
#'   to format and save. By default it saves the last plot made.
#' @param source_name The text you want to come after the text 'Source:' in the
#'   bottom left hand side of your side.
#' @param width Width in inches that you want to save your chart to -
#'   defaults to 9.
#' @param height Height in inches that you want to save your chart to -
#'   defaults to 6.
#' @param logo_image_path File path for the logo image you want to use in the
#'   top bottom right of your chart, which needs to be a PNG file - defaults
#'   to a placeholder image with the same colour as the plot area.
#' @param LU_logo File path to the top right logo - defaults to a placeholder image of background colour. It can also be set to the Swedish or English version by setting it to \code{Lund_sv.png} and \code{Lund_en.png}. There are also logos from different faculties in both Swedish and English. However, you can not add a path to your own Logo. Use \code{logo_image_path} for that. See \code{Section Lund Logos} for possible options.
#' @import grid
#' @import ggplot2
#' @import png
#' @import ggpubr
#'
#' @return A png file with a styled and updated ggplot chart. Also returns the
#'   plot object.

#'@keywords save_poms_plot
#'@details The function is a modified version of a finalise_plot function from
#'  the bbplot package made by the BBC data team.
#'  \url{https://github.com/bbc/bbplot}
#' @section Lund logos:
#'  Here is the list of possible choices for the Lund university logo:
#'  \itemize{
#'    \item Lund_sv.png - Lund University logo; Swedish.
#'    \item Lund_en.png - Lund University logo; English
#'    \item NatVet_sv.png - Lund Faculty of Science logo; Swedish
#'    \item NatVet_en.png - Lund Faculty of Science logo; English
#'    \item SamhVet_sv.png - Lund Faculty of social sciences logo; Swedish
#'    \item SamhVet_en.png - Lund Faculty of social sciences logo; English
#'    \item CEC_sv.png - Centre for Environmental and Climate Science logo; Swedish
#'    \item CEC_en.png - Centre for Environmental and Climate Science logo; English
#'    \item MedFak_sv.png - Lund Faculty of Medicine logo; Swedish
#'    \item MedFak_en.png - Lund Faculty of Medicine logo; English
#'    \item HumTeoFak_sv.png - Lund Joint Faculties of Humanities and Theology logo; Swedish
#'    \item HumTeoFak_en.png - Lund Joint Faculties of Humanities and Theology logo; English
#'    \item JurFak_sv.png - Lund Faculty of Law logo; Swedish
#'    \item JurFak_en.png - Lund Faculty of Law logo; English
#'    \item LTH_sv.png - Lund Faculty of Engineering logo; Swedish
#'    \item LTH_en.png - Lund Faculty of Engineering logo; English
#'    \item Teater_sv.png - Malmö Theatre Academy logo; Swedish
#'    \item Teater_en.png - Malmö Theatre Academy logo; English
#'    \item KonstHS_sv.png - Malmö Art Academy logo; Swedish
#'    \item KonstHS_en.png - Malmö Art Academy logo; English
#'    \item MusikHS_sv.png - Malmö Academy of Music logo; Swedish
#'    \item MusikHS_en.png - Malmö Academy of Music logo; English
#'    \item EkoHS_sv.png - Lund School of Economics and Management logo; Swedish
#'    \item EkoHS_en.png - Lund School of Economics and Management logo; English
#'     }
#' @examples
#' \dontrun{
#' save_poms_plot(save_filepath = "filename_that_my_plot_should_be_saved_to.png",
#'              plot = last_plot(),
#'              source_name = "Source: The source for my data",
#'              width = 9,
#'              height = 6,
#'              logo_image_path = "my_logo.png",
#'              LU_logo = "CEC_en.png")
#' }
#'
#'library(ggplot2)
#' myplot <- ggplot(iris, aes(Petal.Length, Sepal.Length)) +
#'    geom_point() +
#'    facet_wrap(~Species) +
#'    theme_PoMS()
#'
#' save_poms_plot(save_filepath = "Iris_facets.png",
#'              plot = myplot,
#'              source_name = "Source: Iris data",
#'              width = 9,
#'              height = 6)
#'
#'@export

# TODO: make it possible to chose different sub-logos (samhällsvet, ekonomi, lth etc)
# IDEA: Use svg instead of png (or both) in logos

save_poms_plot <- function(save_filepath = "FigX.png",
                         plot = last_plot(),
                         source_name = "Source: RestPoLL",
                         width = 9,
                         height = 6,
                         logo_image_path = file.path(system.file("logos", package = "RestPoLLggtheme"), "placeholder.png"),
                         LU_logo = "placeholderL.png"
) {

  ## THE FOLLOWING FUNCTIONS TAKE CARE OF THE FINALISING OF THE PLOT

  #Left align text
  left_align <- function(plot, pieces){
    grob <- ggplot2::ggplotGrob(plot)
    n <- length(pieces)
    grob$layout$l[grob$layout$name %in% pieces] <- 2
    return(grob)
  }

  # Add a footer with logos
  create_footer <- function(source_name, logo_image_path, LU_logo) {

    LU_logo <- file.path(system.file("logos", package = "RestPoLLggtheme"), LU_logo)

    footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")), # The line at the bottom of figure
                             grid::textGrob(source_name, x = 0.004, hjust = 0, gp = grid::gpar(fontsize = 14)), # The Source text under the line
                             grid::rasterGrob(png::readPNG(logo_image_path), x = 0.92, height = 1.0), # The personal logo, placed in the bottom right.
                             grid::rasterGrob(png::readPNG(LU_logo), x = 0.890 - log(width)^-11.97, y = height / 0.2847222, height = 2.9)) # The Lund University logo image placed at the top right. Orig x,y values x = 0.955, y = 21.47. They did not scale to different plot sizes.
    return(footer)
  }

  # The save function
  save_plot <- function(plot_grid, width, height, save_filepath) {

    grid::grid.draw(plot_grid)
    #save it
    ggplot2::ggsave(filename = save_filepath, plot = plot_grid, width = width, height = height, bg = "#f8f3ea")
  }

  ## NEXT WE USE THE FUNCTIONS TO FINALISE AND SAVE THE PLOT.

  #Make the footer
  footer <- create_footer(source_name, logo_image_path, LU_logo)


  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot, c("subtitle", "title", "caption"))

  #Arrange the plot and footer
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045/(height/6.25)))

   print(paste("SAVING FIGURE TO:", save_filepath))

  #Save the arranged plot
  save_plot(plot_grid, width, height, save_filepath)
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  invisible(plot_grid)
}

