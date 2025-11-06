# mapping.R — Leaflet map rendering

library(leaflet)
library(dplyr)

render_vaccine_map <- function(df) {
  req(nrow(df) > 0)
  leaflet(df) %>%
    addTiles() %>%
    addCircleMarkers(
      lng = ~Longitude, lat = ~Latitude,
      color = ~ifelse(Coverage > 50, "green", "orange"),
      popup = ~paste("<b>", Country, "</b><br>Coverage:", round(Coverage, 1), "%")
    ) %>%
    setView(lng = 20, lat = 0, zoom = 3)
}
