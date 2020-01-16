library('ggplot2', lib='~/R/x86_64-pc-linux-gnu-library/3.6/')

# Read the raw data from file
raw_data = read.csv('data/data.csv')

# Create plot data
value = c()
for (i in 1:5){
    value = c(value, raw_data$lstm_mean[i])
    value = c(value, raw_data$dcrnn_mean[i])
    value = c(value, raw_data$dclstm_mean[i])
}
std = c()
for (i in 1:5){
    std = c(std, raw_data$lstm_std[i])
    std = c(std, raw_data$dcrnn_std[i])
    std = c(std, raw_data$dclstm_std[i])
}
method = rep(c('LSTM', 'DCRNN', 'DCLSTM'), NROW(raw_data))
name = c()
for (x in raw_data$monitor_rate){
    name = c(name, rep(toString(x), 3))
}
data = data.frame(name, method, value, std)
print(value)
print(method)
print(name)

# Plot a simple barchart for lstm_mean and save result
png(file='figure/plot.png')
ggplot(data, aes(fill=method, y=value, x=name)) +
geom_bar(position='dodge', stat='identity') + 
xlab('Monitor rate') + 
ylab('MAE')
#geom_errorbar(aes(x=name, ymin=value-std, ymax=value+std), 
#              width=0.4, 
#              colour='red', 
#              alpha=0.9, 
#              size=1.3)
dev.off()
