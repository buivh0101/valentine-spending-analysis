# Load the libraries
library(tidyverse)
library(ggplot2)
library(plotly)

# Read the CSV file
spending <- read_csv("historical_spending.csv")

# Reshape the data
inventory <- spending %>%
  select(Year, Candy, Flowers, Jewelry, GreetingCards, Clothing, GiftCards) %>%
  pivot_longer(-Year, names_to = "Category", values_to = "Spending")

# Create the spending trend plot
p <- ggplot(inventory, aes(x = Year, y = Spending, color = Category)) +
  geom_line(linewidth = 1) +
  geom_point() +
  scale_y_continuous(labels = scales::dollar) +
  labs(
    title = "Valentine's Day Spending Trends",
    x = "Year",
    y = "Spending per person",
    color = "Category"
  ) +
  theme_minimal()

# Save the plot as a PNG file
ggsave("myplot.png", plot = p, width = 9, height = 6, dpi = 300)

ggplotly(p)
