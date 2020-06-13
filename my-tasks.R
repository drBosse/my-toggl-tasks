#!/usr/bin/env Rscript

library(tidyverse)
library(jsonlite)
library(RColorBrewer)


files <- list.files(
  path = "json",
  pattern = "*.json",
  full.names = TRUE,
  recursive = FALSE
)

toggl.data <- c()

for (file in files) {
  json.data <- fromJSON(file, flatten = TRUE)
  toggl.data <- data.frame(rbind(toggl.data, json.data$data))
}


toggl.data <- toggl.data %>%
  mutate(
    hours = dur/(60*60*1000),
    date = as.Date(start)
  )


project.data <- toggl.data %>%
  group_by(date, project) %>%
  summarise(
    hours = sum(hours),
  )

day.data <- project.data %>%
  group_by(date) %>%
  summarise(
    hours = sum(hours)
  ) %>%
  mutate(
    sum = cumsum(hours)
  )

tasks <- ggplot() +
  geom_col(data = project.data, aes(x = date, y = hours, fill = project)) +
  geom_step(data = day.data, aes(x = date, y = sum/20)) +
  theme(legend.position = "top") +
  theme(legend.title = element_blank()) +
  theme(legend.text = element_text(size = 6, face = "bold")) +
  scale_y_continuous(
    name = "Logged [h]",
    breaks = seq(0, 12, by = 2),
    sec.axis = sec_axis( ~ .*20, name = "Total time [h]", breaks = seq(0, 200, by = 20))
  ) +
  scale_fill_brewer(palette = "Dark2")

tasks

png("tasks.png", width = 5000, height = 3000, res = 550, pointsize = 10)
tasks
dev.off()
