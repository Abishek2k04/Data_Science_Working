library(forecast)
View(EuStockMarkets)


plot(EuStockMarkets[,"DAX"], main = "before forecast",col.main = "darkgreen")




fit <- auto.arima(EuStockMarkets[,"DAX"])

summary(fit)

forecasting <- forecast(fit, 50)

print(forecasting)
plot(forecasting, main = "After Forecast",col.main = "darkgreen")
