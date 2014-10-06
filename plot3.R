tbl <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
tb <- na.omit(tbl[as.Date(tbl$Date, "%m/%d/%Y")== as.Date("02/02/2007","%m/%d/%Y") | as.Date(tbl$Date, "%m/%d/%Y")== as.Date("02/01/2007","%m/%d/%Y"),])
tb$Date = format(as.Date(tb$Date,"%m/%d/%Y"),"%a")
submetering1 <- tb$Sub_metering_1
submetering2 <- tb$Sub_metering_2
submetering3 <- tb$Sub_metering_3
g_range <- range(0, submetering1, submetering2, submetering3)
d_range <- range(tb$Date)
maxg = max(g_range)
plot_colors <- c("black","red","blue")

png(filename="plot3.png", height=480, width=480, bg="white")
plot(submetering1, type="o",col=plot_colors[1],ylim = c(0,maxg), axes=FALSE, ann=FALSE)
axis(1, at=1:3, labels= c(d_range[2], d_range[1], "Sat"))
axis(2, las=1, at= 10*0:maxg)
box()
lines(submetering2, type="o", pch=22, lty=2, col=plot_colors[2])
lines(submetering3, type="o", pch=22, lty=2, col=plot_colors[3])
title(main="Energy Sub Metering", col.main="red", font.main=4)
title(xlab= "Days")
title(ylab= "Energy Sub Metering")
legend(1, maxg, c("submetering1","submetering2","submetering3"), cex=0.8, col=plot_colors, 
       pch=21:23, lty=1:3)
dev.off()
