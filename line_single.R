library(ggplot2)
# Load data
data = read.csv('data/lstm.csv')

# Plot data
png(file='figure/single.png')
 
ggplot(data, aes(x=monitor_rate, y=mean)) + 
    geom_errorbar(aes(ymin=mean-std, ymax=mean+std), colour='black', width=2) +
    geom_line(size=1) +
    geom_point(size=3, shape=21, fill='white') + 
    xlab('Monitor rate') + 
    ylab('MSE') +
    theme(text=element_text(size=20),
          axis.text.x=element_text(size=20),
          axis.text.y=element_text(size=20))


dev.off()
