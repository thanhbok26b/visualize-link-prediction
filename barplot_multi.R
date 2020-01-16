error_bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

# Load data
mean <- read.csv('data/mean.csv')
rownames(mean) <- mean[,1]
mean <- as.matrix(mean[,-1])
std <- read.csv('data/std.csv')
rownames(std) <- std[,1]
std <- as.matrix(std[,-1])
names = c('90', '70', '50', '30', '10')

# Custom the texture
density = c()
for (i in 1:5){
    density = c(density, 20)
    density = c(density, 20)
    density = c(density, 0)
}
angle = c()
for (i in 1:5){
    angle = c(angle, 0)
    angle = c(angle, 45)
    angle = c(angle, 90)
}

# Plot data
png(file='figure/plot.png')

# plot mean
ylim = c(floor((min(mean) - 5) / 10) * 10, ceiling((max(mean) + 5) / 10) * 10)
id <- barplot(mean, 
              names=names,
              density=density,
              angle=angle, 
              beside=T, 
              legend.text=T,
              ylim=ylim, 
              xpd=FALSE,
              xlab='Monitoring rate (%)',
              ylab='MAE',
              main='Abilene SR static route',
              args.legend=list(bty='n', x='top', ncol=3))

# plot std
error_bar(id, mean, std)
dev.off()
