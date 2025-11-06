# plotting.R — Plotly visualization

library(plotly)
library(dplyr)

plot_vaccine_trend <- function(df, country) {
  req(nrow(df) > 0)
  df %>%
    group_by(Date) %>%
    summarise(Coverage = mean(Coverage, na.rm = TRUE)) %>%
    plot_ly(x = ~Date, y = ~Coverage, type = "scatter", mode = "lines+markers",
            line = list(color = "#007BFF", width = 2),
            marker = list(size = 5)) %>%
    layout(title = paste("Vaccine Coverage Over Time —", country),
           xaxis = list(title = "Date"),
           yaxis = list(title = "Coverage (%)"))
}
