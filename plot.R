library('ggplot2', lib='~/R/x86_64-pc-linux-gnu-library/3.6/')

# Read the raw data from file
data = read.csv('data/data.csv')

# Create plot data
plot_data = data.frame(name=data$monitor_rate,
                       mean=data$lstm_mean,
                       std=data$lstm_std)
# Plot a simple barchart for lstm_mean and save result
png(file='figure/plot.png')
ggplot(plot_data) + 
geom_bar(aes(x=name, y=mean), 
         stat='identity', 
         fill='skyblue',
         alpha=0.7) + 
geom_errorbar(aes(x=name, ymin=mean-std, ymax=mean+std), 
              width=0.4, 
              colour='red', 
              alpha=0.9, 
              size=1.3)
dev.off()
