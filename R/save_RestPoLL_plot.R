
#' Arrange, style and save the ggplot chart
#'
#' Running this function with the plot name as variable will save your plot with some
#' extra styling. It will add Arial as default text font. It will also left align your
#' title, subtitle and source, add and optional RestPoLL logo in the top right, and save
#' it to your specified location.
#'
#'
#' @param save_filepath Exact file-path that you want the plot to be saved to,
#'   or just the name of the file. Default file-path is the working directory
#' @param plot The name of the plot (saved in an object) you have created that
#'   you want to format and save. By default it saves the last plot made.
#' @param source_name The text you want to come after the text 'Source:' in the
#'   bottom left hand side of your side. Defaults to the funding text of EU
#'   Horizon project
#' @param width Width in inches that you want to save your chart to - defaults
#'   to 9.
#' @param height Height in inches that you want to save your chart to - defaults
#'   to 6.
#' @param logo_image_path File path for the logo image you want to use in the
#'   bottom left of your chart, which needs to be a PNG file - defaults to a
#'   EU-flag image.
#' @param RestPoLL_logo File path to the top right logo - defaults to a
#'   placeholder image of background colour. There are different logos in colour
#'   and black and white. However, you can not add a path to your own Logo. Use
#'   \code{logo_image_path} for that. See \code{Section RestPoLL Logos} for
#'   possible options.
#' @import grid
#' @import ggplot2
#' @import png
#' @import ggpubr
#'
#' @return A png file with a styled and updated ggplot chart. Also returns the
#'   plot object.

#'@keywords save_restpoll_plot
#'@details The function is a modified version of a finalise_plot function from
#'  the bbplot package made by the BBC data team.
#'  \url{https://github.com/bbc/bbplot}
#' @section RestPoLL logos:
#'  Here is the list of possible choices for the RestPoLL logo:
#'  \itemize{
#'    \item Restpoll.png - The RestPoLL logo in colour, text under.
#'    \item Restpoll-bw.png - The RestPoLL logo in black and white, text under.
#'    \item Restpoll-long.png - The RestPoLL logo in colour, text to the right.
#'    \item Restpoll-long-bw.png - The RestPoLL logo in black and white, text to the right.
#'    \item Restpoll-notext.png - The RestPoLL logo in colour, without text.
#'    \item Restpoll-notext-bw.png - The RestPoLL logo in black and white, without text.
#'     }
#' @examples
#' \dontrun{
#' save_restpoll_plot(save_filepath = "filename_that_my_plot_should_be_saved_to.png",
#'              plot = last_plot(),
#'              source_name = "Source: The source for my data",
#'              width = 9,
#'              height = 6,
#'              logo_image_path = "EU-flag.png",
#'              RestPoLL_logo = "Restpoll.png")
#'
#'library(ggplot2)
#' myplot <- ggplot(iris, aes(Petal.Length, Sepal.Length)) +
#'    geom_point() +
#'    facet_wrap(~Species) +
#'    theme_RestPoLL()
#'
#' save_restpoll_plot(save_filepath = "Iris_facets.png",
#'              plot = myplot,
#'              source_name = "Source: Iris data",
#'              width = 9,
#'              height = 6)
#'
#' }
#'
#'@export

save_restpoll_plot <- function(save_filepath = "FigX.png",
                         plot = last_plot(),
                         source_name = "This project receives funding from the European Union's\nHorizon Europe Framework Programme under project No. 101082101.",
                         width = 9,
                         height = 6,
                         logo_image_path = file.path(system.file("logos", package = "RestPoLLggtheme"), "EU-flag.png"),
                         RestPoLL_logo = "placeholderL.png"
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
  create_footer <- function(source_name, logo_image_path, RestPoLL_logo) {

    RestPoLL_logo <- file.path(system.file("logos", package = "RestPoLLggtheme"), RestPoLL_logo)

    footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")), # The line at the bottom of figure
                             grid::textGrob(source_name, x = 0.048, hjust = 0, gp = grid::gpar(fontsize = 8)), # The Source text under the line to the botom left
                             grid::rasterGrob(png::readPNG(logo_image_path), x = 0.02, height = 1.2), # The personal logo, placed in the bottom left.
                             grid::rasterGrob(png::readPNG(RestPoLL_logo), x = 0.99 - log(width)^-11.97, y = height / 0.281, height = 2.1, hjust = 1)) # The RestPoLL logo image placed at the top right. Orig x,y values x = 0.955, y = 21.47. They did not scale to different plot sizes.
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
  footer <- create_footer(source_name, logo_image_path, RestPoLL_logo)


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

