# library & example dataset
library(ggplot2)
library(gridExtra)
head(mpg)
mpg_select <- mpg[mpg$manufacturer %in% c("audi", "ford", "jeep", "volkswagen"), ]
theOrdered <- within(mpg_select,
                    class <- factor(class, 
                    levels=names(sort(table(class), 
                    decreasing=TRUE))))

# Bar
g1 <- ggplot(theOrdered, aes(class))+ 
  geom_bar(aes(fill=manufacturer), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  labs(title="Count of 4 observed manufacturers")

# Faceting 透過 facet_wrap() 納入類別變數的展開
g2 <- ggplot(theOrdered, aes(y=hwy, x=manufacturer, fill=manufacturer)) + 
  geom_bar(stat = "identity")+    
  facet_wrap(~class)+
  labs(title="hwy btw class and manufacturers")

# Scatterplot
g3<- ggplot(mpg_select, aes(cty, hwy))+ 
  geom_point(aes(color = manufacturer)) + 
  geom_smooth(method="lm", se=F) +
  labs(y="hwy", 
       x="cty", 
       title="Correlation btw city mileage and highway mileage")

# Bubble plot
g4<- ggplot(mpg_select, aes(displ, hwy)) + 
  geom_jitter(aes(col=manufacturer, size=cyl)) + 
  geom_smooth(aes(col=manufacturer), method="lm", se=F)+
  labs(title="displ x hwy x cyl x manufacturer",
       caption="Data Source:'mpg' dataset")

# Show the 4 plots on the same page
grid.arrange(g1, g2, g3, g4, ncol=2, nrow=2)