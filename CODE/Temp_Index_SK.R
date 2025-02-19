library(tidyverse)
read_csv("data/GLB.Ts+dSST.csv", skip=1, na = "***") %>%
  select(year = Year, t_diff = `J-D`) %>%
  ggplot(aes(x=year, y=t_diff)) +
  geom_line(color = "gray", size=0.5) +
  geom_point(fill="white", color="gray", shape=21 ) +
  geom_smooth(se=FALSE, color="black", size=1, span=0.15) +
  scale_x_continuous(breaks=seq(1880, 2024, 20), expand=c(0,0)) +
  scale_y_continuous(limits=c(-0.5, 1.5), expand=c(0,0)) +
  labs(
    x = "YEAR",
    y = "Temperature Anomaly (C)",
    Title = "GLOBAL LAND-OCEANIC TEMPERATURE INDEX",
    subtitle = "Data Source: NASA'S Goddard Institute for Space Studies (GISS)\nCredit: NASA/GISS"
  )
  theme_light() +
  theme(
    axis.ticks = element_blank()
  )
ggsave("FIGURES/Temp_Index_Plot.png", width = 6, height = 4)
