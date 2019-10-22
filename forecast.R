library(forecast)
library(readxl)

#load data
data= read_excel("Costo Canasta Basica INE.xlsx", 
                                       skip = 1)
#convert to time series
tsdata = ts(data$`Costo Mensual (Q)`,start=c(2000,1),frequency=12)
tsdata 

#run model
modelo = auto.arima(tsdata)
summary(modelo)

#forecast
pronostico=forecast(modelo,12,level = 95)
plot(pronostico)
