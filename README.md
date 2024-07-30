# RestPoLL ggtheme

This is a ggplot2 theme based on the [RestPoLL](https://restpoll.eu/) graphical profile.

## Motivation

RestPoLL's graphic profile is thought to make all communication via figures as coherent as possible with colours and general look. This package was created to make it easier to add a theme to figures `theme_RestPoll()` created with `ggplot2()` that set the RestPoLL brand colours. There is also a `save_restpoll_plot()` that add logos and funding text, and save the figre as a png or pdf.

For more info on RestPoLL graphic design look at the brand guide:
[Brand guide (pdf)](https://restpoll.eu/wp-content/uploads/2024/03/RestPoll-Brand-guide-1.pdf)

### R and ggplot2 for making graphics

Many researchers today use the open source software [R](https://www.r-project.org/) to analyse data and create figures and other visualisations. A very popular package to do that is `ggplot2`, which makes it relatively easy to change the look of the resulting figure. This is done by adding themes.
However, if there is no existing theme that suits your preferences this can require a lot of tweaking.

The `RestPoLLggtheme` package makes it possible to adhere to the graphic profile of the RestPoLL project.

## Install

The package can be downloaded from the [***RestPoLL GitHub***](https://github.com/RestPoll/RestPoLLggtheme) repository.

To install the package in R one first needs `remotes` which can be installed from **CRAN**; `install.package('remotes')`.


You will for the moment also need a *personal access token* with at least `repo` scope filled in. You can get that at:
[https://github.com/settings/tokens](https://github.com/settings/tokens)

Then use `remotes` to install the theme package:

`remotes::install_github('RestPoLL/RestPoLLggtheme', auth_token = "your token")`

## Usage

The package come with the ordinary help files and for all functions you can find some usage help in the usual R way.
For example to find help on the `theme_RestPoLL()` write `?theme_RestPoLL`.

After a ggplot call you can specify the `theme_RestPoLL()`. In the theme you can set the *base*, *title*, and *subtitle* text size and fontfamily. See **Examples** below.

You can also specify `scale_colour_RestPoLL()`and `scale_fill_RestPoLL()` to get colour schemes on e.g. points, lines and bars.

To make a plot with further styling and possibility to add logos, save the ggplot with `save_restpoll_plot()`. It will by default save the last plot but a plot object can be supplied with the `plot = ` argument. The plot will also by default be saved to the current working directory with the name 'FigX.png' in 9 x 6 inches (width x height), with a EU-flag and funding text in the bottom left corner and without any further logos.

See `?save_restpoll_plot()` for more information.

For known issues see **Known Issues** below.

### Examples

    library(ggplot2)
    library(RestPoLLggtheme)

    ggplot(iris, aes(Sepal.Width, Sepal.Length, colour = Species)) +
        geom_point(size = 3)  +
        scale_colour_RestPoLL() +
        labs(title = "RestPoLL plot", subtitle = "SUBTITLE IN ALL CAPS") +
        theme_RestPoLL(title_font = "Lora", sub_title_font = "Lora")
        
    save_restpoll_plot("Iris_plot.png", RestPoLL_logo = "RestPoLL.png")


    ggplot(diamonds , aes(depth, fill = cut, colour = cut)) +
    geom_density(na.rm = TRUE) +
    coord_cartesian(xlim = c(58, 68)) +
    labs(title = "Density plot of diamond depth", subtitle = "DIFFERENTIATED BY CUT", colour = "Cut:", fill = "Cut:") +
    scale_fill_RestPoLL("both") +
    scale_colour_RestPoLL("both") +
    theme_RestPoLL(title_family = "Lora", subtitle_family = "Lora", title_size = 18, subtitle_size = 18)
    
    save_restpoll_plot(save_filepath = "RestPoLL_theme_density_12x10.png", RestPoLL_logo = "Restpoll.png", width = 12, height = 10)

## Known Issues

### Fonts

This version use `showtext` package to handle text families and hopefully this will solve some of the font issues.


### Logos

The logos does not always come out as big and nice as wanted. This is an area where more development would be needed.

## Development and Contributions

The development of this package have been done by Georg Andersson at the **Biology department** at Lund University.

### Contribute to theme

If you want to contribute or have suggestions and ideas, add an **Issue** on the GitLab project page.

[https://github.com/RestPoll/RestPoLLggtheme/issues](https://github.com/RestPoll/RestPoLLggtheme/issues)

If you are familiar with Git and merge request and that kind of workflow you can  use that. In short:

- fork the project
- clone it to your computer
- make a new branch and change what you had in mind
- commit the changes
- push this to your fork and make a merge request
