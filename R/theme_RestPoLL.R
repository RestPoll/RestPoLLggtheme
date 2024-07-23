#' Add a RestPoLL Theme to ggplot2 Figures
#'
#' This function allows you to add the RestPoLL theme to your ggplot graphics.
#'
#' @details \code{theme_RestPoLL} sets the theme for RestPoLL figures,
#'   using the graphical profile colours in the figure plot area, gridline,
#'   axis, facets etc. You can change the size and font family of the basic text, title and subtitle
#'   directly in the theme function. The article theme is pre-set to suit articles with a bold title in bronze colour.

#' @author Georg Andersson, Biodiversity, Lund University
#' @usage theme_RestPoLL(base_size = 22, base_family = "Arial",
#'    title_size = 28, title_family = "Arial", subtitle_size = 24,
#'    subtitle_family = "Arial")
#' @param base_size Font size
#' @param base_family Font family for the basic text.
#' @param title_size Font size of plot title.
#' @param subtitle_size Font size of plot subtitle.
#' @param title_family Font family for the titles. Including plot title, as
#'   well as the facet strip titles. However, not for subtitle.
#' @param subtitle_family Font family for the subtitle.
#' @return Returns the plot object made with your \link{ggplot2} functions but styled for Pollinator monitoring at LU
#' @keywords theme_PoMS
#' @import ggplot2
#' @seealso \code{\link{ggplot2}}
#'
#' @examples
#'    library(ggplot2)
#'    library(RestPoLLggtheme)
#'
#'    p1 <- ggplot(diamonds, aes(carat, price, color = color)) +
#'      geom_point() +
#'      facet_wrap(~cut) +
#'      labs(title = "Test of the Lund theme", subtitle = "I hope it works well")
#'
#'    p1 + theme_RestPoLL()
#'
#' @export

theme_RestPoLL <- function(base_size = 22, base_family = "Arial", title_size = 28, title_family = "Arial", subtitle_size = 24, subtitle_family = "Arial") {


  base_line_size = base_size/26
  base_rect_size = base_size/26

  # sets the colours for the different elements.

  # Legends
  lulegcol = "#ffffff"  #light pink RGB(191 184 175)
  # Plot background
  luplotcol = "#ffffff"  # Beige transparent, "#f8f3ea"
  # Plotting area background
  lupanelcol =  "#ffffff" #fffafa"  # white naturel
  # Grid lines
  lugridcol = "#f4fff1"  #light grey / beige
  # Panel strips
  lustripcol =  "#ffffff"#  #Green transparent, "#dedbd9"
  # Line colour
  lulinecol = "#4d4c44"  #dark grey
  # Text colours
  lutextcol = "#4d4c44"  #dark grey
  # Title colour
  lutitcolour = "#000000"


  ggplot2::theme(

    ## BASE SETTINGS----
    #Basic line rect, and text formats

    line = ggplot2::element_line(colour = lulinecol,
                        linewidth = base_line_size,
                        linetype = 1,
                        lineend = "butt"),
    rect = ggplot2::element_rect(fill = "white",
                        colour = "black",
                        linewidth = base_rect_size,
                        linetype = 1),
    text = ggplot2::element_text(family = base_family,
                        face = "plain",
                        colour = lutextcol,
                        size = base_size,
                        lineheight = 0.9,
                        hjust = 0.5,
                        vjust = 0.5,
                        angle = 0,
                        margin = ggplot2::margin(0,0,0,0),
                        debug = FALSE),
    #AXIS----
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins.
    axis.title.x = ggplot2::element_text(family = base_family,
                                         size = base_size,
                                         face = "bold",
                                         color = lutextcol),
    axis.title.y =  ggplot2::element_text(family = base_family,
                                          size = base_size,
                                          face = "bold",
                                          color = lutextcol,
                                          angle = 90,
                                          margin = ggplot2::margin(r = 7)),
    axis.text = ggplot2::element_text(family = base_family,
                                      face = "bold",
                                      size = base_size*0.9,
                                      color = lutextcol),
    axis.text.x = ggplot2::element_text(margin = ggplot2::margin(b = 7)),
    axis.text.y = ggplot2::element_text(hjust = 1, margin = ggplot2::margin(r = 2)),
    axis.ticks = ggplot2::element_line(),
    axis.ticks.length = ggplot2::unit(0.3, "lines"),
    axis.line = ggplot2::element_line(),


    ## LEGENDS----
    #Legend format
    #This sets the position and alignment of the legend, and background for it, and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.spacing = ggplot2::unit(base_size/4, "pt"), # The spacing between legends
    legend.position = "top",
    legend.justification = "left",
    legend.direction = NULL,
    legend.margin = ggplot2::margin(base_size/2, base_size/6, base_size/6, base_size/6), # The margin around each legend
    legend.text.align = 0,
    legend.background = ggplot2::element_rect(fill = luplotcol, colour = NA),
    legend.title = ggplot2::element_text(family = base_family,
                                         face = "bold",
                                         size = base_size),
    legend.title.align = 1,
    legend.key = ggplot2::element_rect(fill = lulegcol, colour = NA),
    legend.key.size = ggplot2::unit(base_line_size, "lines"),

    legend.text = ggplot2::element_text(family = base_family,
                                        size = base_size,
                                        color = lutextcol),
    legend.box = NULL,
    legend.box.just = "left",
    legend.box.background = ggplot2::element_rect(fill = luplotcol,
                                                  linetype = "blank",
                                                  colour = luplotcol),
    legend.box.spacing = ggplot2::unit(base_size/4, "pt"), # Spacing between plotting area and the legend box
    legend.box.margin = ggplot2::margin(0, 0, 0, 0), # margins around the legend area


    ## PANELS----
    # This is the plotting area

    #This sets the panel background a costum color, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_rect(fill = lupanelcol, colour = NA),
    # panel.border = element_rect(fill = luplotcol),
    panel.border = ggplot2::element_blank(),
    panel.spacing = ggplot2::unit(base_size/4, "pt"),
    panel.ontop = F,

    #Grid lines
    #This sets minor and major gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid = ggplot2::element_line(color = lugridcol,
                              linewidth = rel(1)),
    panel.grid.minor = ggplot2::element_blank(),
    #panel.grid.minor.y = ggplot2::element_line(color = "#e6ecf0", linewidth = rel(0.7)),
    panel.grid.major.y = ggplot2::element_line(color = lugridcol,
                                               linewidth = rel(0.7)),
    panel.grid.major.x = ggplot2::element_line(color = lugridcol,
                                               linewidth = rel(0.7)),


    ##PLOT----
    # This is the entire plot

    #Plot background sets the color for the entire plot
    plot.background = ggplot2::element_rect(fill = luplotcol, colour = luplotcol),


    #Title formats:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family = title_family,
                                       size = title_size,
                                       face = "plain",
                                       colour = lutitcolour,
                                       hjust = 0,
                                       vjust = 1,
                                       margin = ggplot2::margin(0,0,b = base_size*0.5,0)),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family = subtitle_family,
                                          size = subtitle_size,
                                          face = "plain",
                                          colour = lutextcol,
                                          hjust = 0,
                                          vjust = 1,
                                          margin = ggplot2::margin(0,0,b = base_size*0.5,0)),
    plot.title.position = "plot",
    plot.caption = ggplot2::element_blank(),  #This leaves the caption text element empty, because it is set elsewhere in the save_LU_plot function
    plot.caption.position = "plot",
    plot.tag = ggplot2::element_text(size = rel(1.2),
                            hjust = 0.5,
                            vjust = 0.5),
    plot.tag.position = "topleft",
    plot.margin = ggplot2::margin(20,5,5,20),


    ## FACETS----
    # Thi is the strips in e.g. facets

    #Strip background (#This sets the panel background for facet-wrapped plots to a costum color, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title, etc.)
    strip.background = ggplot2::element_rect(fill = lustripcol, colour = NA),
    strip.text = ggplot2::element_text(family = subtitle_family,
                                       colour = lutextcol,
                                       size  = base_size,
                                       face = "bold",
                                       hjust = 0.5,
                                       margin = ggplot2::margin(0.4 * base_size, 0.4 * base_size, 0.4 * base_size, 0.4 * base_size)),
    strip.placement = "outside",
    strip.switch.pad.grid = ggplot2::unit(base_size/4, "pt"),
    strip.switch.pad.wrap = ggplot2::unit(base_size/4, "pt"),

    ## INHERITS FROM PARENT----
    # These ara all elements that inherits from the parent and can be set to null
    axis.title.x.top = NULL, axis.title.y.right = NULL, axis.text.x.top = NULL, axis.text.y.right = NULL,  axis.ticks.length.x = NULL, axis.ticks.length.x.top = NULL, axis.ticks.length.x.bottom = NULL, axis.ticks.length.y = NULL, axis.ticks.length.y.left = NULL, axis.ticks.length.y.right = NULL, axis.line.x = NULL, axis.line.y = NULL,  legend.spacing.x = NULL, legend.spacing.y = NULL, panel.spacing.x = NULL, panel.spacing.y = NULL, strip.text.x = NULL, strip.text.y = NULL, strip.text.x.top = NULL, strip.text.x.bottom = NULL, strip.text.y.left = NULL, strip.text.y.right = NULL, legend.key.height = NULL, legend.key.width = NULL,

    ## Complete  theme?----
    complete = TRUE # this states if the theme is a complete theme. It will then inherit from blank elements, and behave a bit differently when added to ggplot objects.
  )
}
