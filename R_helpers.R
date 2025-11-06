# helpers.R — data management and reactive utilities

load_vaccine_data <- function(path) {
  read_csv(path, show_col_types = FALSE) %>%
    mutate(Date = as.Date(Date))
}

filter_data <- function(df, country, vaccine, daterange) {
  df %>%
    filter(
      is.null(country) | Country == country,
      is.null(vaccine) | Vaccine == vaccine,
      between(Date, daterange[1], daterange[2])
    )
}
