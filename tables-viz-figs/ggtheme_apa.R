#APA theme for ggplot graphs! 
##modified from [https://sakaluk.wordpress.com/author/jksakaluk/]

apa_theme = theme_bw() + 
    theme(
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        panel.border = element_blank(), 
        text = element_text(family = 'Arial'), 
        legend.title = element_blank(), 
        legend.position = c(.7,.8), 
        axis.line.x = element_line(color = 'black'), 
        axis.line.y = element_line(color = 'black')
        )

#example code:
p = ggplot(dat, aes(x = x, y = y, shape = z)) +
    #Add lines connecting data points
    geom_line() +
    #Add the data points.
    geom_point(size = 4)+
    #Label the y-axis 'Eigenvalue'
    scale_y_continuous(name = 'Eigenvalue') +
    #Label the x-axis 'Factor Number', 
    #ensure that it ranges from 1-max # of factors, increasing by one.
    scale_x_continuous(name = 'Factor Number', 
                       breaks = min(dat$num):max(dat$num)) +
    #Manually specify the different shapes to use for actual and simulated data 
    #in this case, white and black circles
    scale_shape_manual(values = c(16, 1)) +
    #Add vertical line indicating PA suggested max # of factors to retain
    geom_vline(xintercept = dat$nfact, linetype = 'dashed') +
    #Apply our APA-formatting theme
    apatheme

#Call the plot. Looks pretty!
p
