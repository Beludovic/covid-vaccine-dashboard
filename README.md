# 🧬 COVID-19 Vaccine Coverage Dashboard

![R](https://img.shields.io/badge/R-%23276DC3.svg?style=for-the-badge&logo=R&logoColor=white)
![Shiny](https://img.shields.io/badge/Shiny-1.0-blue?style=for-the-badge)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

An interactive R/Shiny dashboard to visualize **COVID-19 vaccine coverage** across African countries using WHO open data.

---

## 🎯 Key Features

- Dynamic country and vaccine-type filters  
- Interactive **Plotly** time-series graphs  
- **Leaflet** map of vaccination coverage  
- Summary indicators and key metrics  
- Export filtered data to CSV  
- Clean, modular codebase (helpers, plotting, mapping)

---

## ⚙️ Installation

```R
# Install dependencies
install.packages(c("shiny","dplyr","plotly","leaflet","readr","ggplot2","shinythemes","DT"))

# Clone and run
library(shiny)
runApp("path/to/covid-vaccine-dashboard")

**🧩 8. DESCRIPTION**

Package: covid-vaccine-dashboard
Title: COVID-19 Vaccine Coverage Dashboard
Version: 1.0
Author: Ludovic Bekou
Maintainer: Ludovic Bekou <bekouludovic@gmail.com>
Description: Interactive Shiny dashboard visualizing COVID-19 vaccine coverage across African countries using WHO data.
License: MIT
Encoding: UTF-8
LazyData: true

