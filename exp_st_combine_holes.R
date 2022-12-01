# exp_st_combine_holes.R

load(file="exp_st_combine_holes.Rdata")
library(leaflet)
library(sf)
library(tidyverse)

# Map with Walking distance polygones
KITAmap2 <- KITAmap %>%
  addPolygons(data = walktime,
              color = "#00A600",
              weight = 1.5,
              opacity = 1.0,
              fillOpacity = 0.2
  )
KITAmap2

# Combine walktime polygones to one
walktime2 <- st_combine(walktime) #%>% st_cast("MULTIPOLYGON")
class(walktime2)

# Combined polygone has holes - Why?
KITAmap3 <- KITAmap %>%
  addPolygons(data = walktime2,
              color = "#00A600",
              weight = 0,
              #opacity = 1.0,
              fillOpacity = 1.0
              )
KITAmap3
  