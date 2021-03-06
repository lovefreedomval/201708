#Create data
EA <- country[(country$Region == "Eastern Asia") , ]
country_LEO <- EA[order(EA$LifeExpectancy), ] #資料依指定欄位排序

#give parameters n define rows to graph
par(mar=c(4,7,2,3),las=1,mfrow=c(2,2))

#plot 1
hist(rnorm(10000), main = "Normal Distribution Demo", border=F,col="lightpink",freq = FALSE)
lines(density(rnorm(10000)), col="violetred1")

#plot 2
plot(cars$speed, cars$dist, col=cars$speed,main = "Correlation btw Speed n Distance")
fitline <- lm(dist ~ speed, data = cars)
abline(fitline, lwd = 4, col = "violetred1")


#plot 3
bar_plt <- barplot(country_LEO$LifeExpectancy,
                   names.arg = country_LEO$Name,
                   horiz = TRUE, las = 1,
                   cex.names = 0.8,
                   cex.axis = 0.8,
                   col = "rosybrown1",
                   xlab = "Life Expectancy",
                   main = "Life Expectancy of Eastern Asian Countries",
                   xlim = c(0, 90))
#座標的文字格式設定
text( x = country_LEO$LifeExpectancy, y = bar_plt,
     label = country_LEO$LifeExpectancy, 
     cex = 1,
     col = "hotpink",
     pos = 4)

#Plot 4
symbols(EA$GNP, 
        EA$LifeExpectancy, 
        circles = sqrt(EA$Population / pi),
        main = "Life Expectancy x GNP X Population of Eastern Asia country",
        bg = "hotpink", 
        fg = "white",
        xlab = "GNP", 
        ylab = "Life Expectancy")
text(x = EA$GNP,y = EA$LifeExpectancy,label = EA$Name, pos = 3)