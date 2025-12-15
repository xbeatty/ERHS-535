Project Title: Examining Health and Nutrition in South America

Authors: Xuan Beatty, Madison Johnson, Kapahi Kawai Puaa, Andrea Sanchez Hidalgo

1. Description / Purpose:

This project analyzes health, nutrition, and socio-economic indicators across South American countries, including child and 
adult health outcomes, GDP, and measures of political stability. It visualizes 
and explores patterns and relationships among these factors to better understand 
how economic and political contexts influence population health.The project exists to provide a comprehensive, data-driven perspective on the 
multiple determinants of health, enabling researchers, policymakers, and 
organizations to identify correlations and trends that may inform public health 
strategies.By integrating nutrition, health, economic, and political data, the project 
addresses the problem of fragmented analysis, offering a holistic view that can 
highlight areas of vulnerability and support evidence-based interventions across 
multiple domains.

2. Installation Instructions

All required packages are located in the FINAL.Rmd file, under the "setup" R chunk that is not included in the knit.
The data for this project, an up-to-date global food security survey, 
can be downloaded directly from github and will require the tidytuesdayR package.

3. Usage

The code in RMarkdown is broken up from the total population of South America to
tabs containing specific data on adult or children populations. 

Example of downloading data from October 14th, 2025

food_security <- read_csv(
  "https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-10-14/food_security.csv")

Environments created in this code that are used often

food_security: refers to the entire dataset downloaded from github &
food_south: refers to the South American subset

4. Project Structure

├── Notes/ 
In this folder you will find the personal codes used to create the total population,
adult, and children graphs created by the authors

├── Presentations/  
This folder contains drafts of the presentations we were creating for this final

├── Draft_One/  
This folder contains our first draft for this project. This is NOT out complete final

5. R Information

R version.string R version 4.5.1 (2025-06-13)
