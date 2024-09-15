# Data Set Description

This dataset provides detailed information on Battery Electric Vehicles (BEVs) and Plug-in Hybrid Electric Vehicles (PHEVs) registered in Washington State. [See the original data set here](https://www.kaggle.com/datasets/muhammadehsan000/2024-electric-car-data-washington-state).

# Overview

This analysis delves into the trends in electric vehicle adoption in Washington State, aiming to uncover patterns and insights related to the growth of electric vehicles over the years. Driven by the increasing importance of sustainable transportation, this project seeks to provide valuable information for
consumers and other parties interested in the evolution of the electric vehicle market.

# The Questions I Want to Answer in this Analysis:

1. How has the adoption of electric vehicles (EVs) changed over the years?
2. Do certain Electric Utility providers have a higher concentration of electric vehicles?
3. Which makes and models of electric vehicles are most popular?
4. How does electric vehicle adoption vary by county?

# Tools Used for Electric Vehicles Analysis

**Python** was the primary programming language employed for this analysis. It provided a robust foundation for data manipulation, analysis, and visualization. The following Python libraries were instrumental:

- **Pandas:** Utilized for data cleaning, manipulation, and exploration.
- **Matplotlib:** Employed to create basic visualizations and charts.
- **Seaborn:** Leveraged for generating more complex and aesthetically pleasing visualizations.

**Jupyter Notebooks** served as an interactive environment for running Python scripts and incorporating explanatory notes and analysis. This facilitated a streamlined workflow and enhanced understanding of the results.

**Visual Studio Code** was the preferred code editor for writing and executing Python scripts, offering a user-friendly interface and essential features for efficient development.

**Git and GitHub** were essential for version control and collaboration. They allowed me to track changes, share code, and collaborate effectively with others involved in the project.

# The Analysis

## 1. How has the popularity of EVs evolved in recent years?

To find the trend of Electric Vehicles popularity overtime. I grouped the data by 'Model Year' and 'Electric Vehicle Type' and counted the vehichles for each year. This query shows how the adoption of EVs evolved over the years and what type of vehicles are more popular.

View my notebook with detailed steps here: [2_Trends_in_EV_Adoption.ipynb](Project_EVs/2_Trends_in_EV_Adoption.ipynb)

### Visualization Results

![Visualization for Trends in EV Adoption](Images/Trends_in_EV_Adoption.png)

#### Zoomed In Visualization (From 2010 and Up)
![Visualization for Trends in EV Adoption from Year 2010 and Up](Images/Trends_in_EV_Adoption_Zoomed_In.png)

### Insights

- Electric vehicles (EVs) experienced a significant surge in popularity from 2011 onwards. Models released prior to this year generally have a lower market share.
- A marked increase in EV sales occurred in 2018, with a sustained upward trend culminating in a substantial rise in 2023.
- Battery Electric Vehicles (BEVs) have consistently outpaced Plug-in Hybrid Electric Vehicles (PHEVs) in terms of market preference.

## 2.Do certain Electric Utility providers have a higher concentration of electric vehicles?

To analyze the concentration of electric vehicles (EVs) among electric utility providers, I extracted the names of providers from the dataset, grouped the data by provider, and counted the number of vehicles associated with each. I then focused on the two providers with the highest EV concentrations, grouping all others into a single category. This analysis allowed for a clear comparison of EV concentrations among the identified providers.

View my notebook with detailed steps here:
[Impact_of_Electric_Utility_Providers](3_Impact_of_Electric_Utility_Providers.ipynb)

### Visualize the Data
```python
plt.figure(figsize=(8, 6))
utility_counts_sorted = visualization_utility_counts.sort_values(by='Number of Vehicles', ascending=False)

# Get bar positions for centering labels
bar_positions = plt.bar(utility_counts_sorted['Electric Utility'], utility_counts_sorted['Number of Vehicles'], color='skyblue')

# Add labels above each bar with centering
for bar, value in zip(bar_positions, utility_counts_sorted['Number of Vehicles']):
  plt.text(bar.get_x() + bar.get_width() / 2, value + 0.1, f"{value}", ha='center', va='bottom', fontsize=10)  # Adjust offset and font size as needed

plt.title('Concentration of Electric Vehicles by Utility Provider')
plt.xlabel('Electric Utility Provider')
plt.ylabel('Number of Electric Vehicles')
plt.xticks(rotation=90)
plt.show()
```

### Results
![Concentration of Electric Vehicles by Utility Provider](Images/Concentration_of_Electric_Vehicles_by_Utility_Provider.png)
*Bar graph visualizing the concentration of EVs by Utility Provider.*

### Insights
- Puget Sound Energy Inc. and Bonneville Power Administration are the two major providers with a significant concentration of electric vehicles (EVs).
- Puget Sound Energy Inc. maintains a substantial lead in EV adoption, indicating a higher level of EV penetration in its service area.
- Bonneville Power Administration also demonstrates a notable concentration of EVs, suggesting that various factors, such as regional policies, infrastructure development, and consumer preferences, are influencing EV adoption in its jurisdiction.
- Unknown/Other Utilities represent a diverse group of smaller providers or utilities with insufficient data to accurately determine their EV concentrations.

## 3. Which makes and models of electric vehicles are most popular?

To identify the most popular car makes and models, I initially segmented the data by the 'Make' column to determine the relative popularity of different automotive manufacturers. Subsequently, I grouped the data by both 'Make' and 'Model' to pinpoint the specific vehicles that are most favored in Washington state. This analysis provides valuable insights into the preferences for electric vehicles among Washington residents.

View my notebook with detailed steps here:
[Electric_Vehicle_Popularity_by_Make_and_Model](4_Electric_Vehicle_Popularity_by_Make_and_Model.ipynb)

### Visualizations

![Top 10 Most Popular Electric Vehicle Makes](Images/Top_10_Most_Popular_Electric_Vehicle_Makes.png)
*Bar graph visualizing the most popular companies producing EVs in Washington state.*

![Top 10 Most Popular Electric Vehicle Makes](Images/Top_10_Most_Popular_Electric_Vehicle_Models.png)
*Bar graph visualizing the most popular Electric Vehicle models in Washington state.*

### Insights
- Tesla continues to dominate the EV market in Washington, with three of its models (Model Y, Model 3, and Model S) occupying the top three positions. This dominance highlights Tesla's strong brand recognition, innovative technology, and extensive charging infrastructure.
- While Tesla maintains a strong lead, the EV market in Washington is becoming increasingly diverse. Traditional automakers like Nissan, Chevrolet, and Ford are gaining traction, and emerging players like Kia, Toyota, and Volkswagen are also making a significant presence. This suggests that consumers are considering a wider range of options when choosing an EV.
- The Nissan Leaf, one of the earliest mass-produced EVs, maintains a significant presence in the market. Its popularity can be attributed to its early entry, affordability, and reliability.
- Chevrolet and Ford have successfully entered the EV market with their Bolt EV and Mustang Mach-E models, respectively. These models have contributed to the growing diversity of EV options available to consumers.

## 4. How does electric vehicle adoption vary by county?

To see which county has the highest number of EVs. First I grouped the data by county and arranged them form highest to lowest concentration. Then I extracted the top 10 counties with the highest EV consentration and visualized the data on a bar graph. This analysis provided insights about which counties in Washington State people are more inclined to buy EVs.

View my notebook with detailed steps here:
[lectric_Vehicle_Adoption_by_County](5_Electric_Vehicle_Adoption_by_County.ipynb)

### Visualization

![Top 10 Counties by Electric Vehicle Adoption](Images/Top_10_Counties_by_Electric_Vehicle_Adoption.png)
*Bar graph visualizing the counties in Washington state where Electric Vehicles are most popular.*

### Insights
- King County, with an impressive 94,460 electric vehicles, stands out as the clear leader in EV adoption among the counties analyzed. This significant lead suggests a strong preference for electric vehicles within the county.
- Snohomish and Pierce Counties, with 21,439 and 14,043 electric vehicles respectively, occupy the second and third positions. These counties demonstrate a notable level of EV adoption, indicating a growing trend towards electric mobility.
- The top five counties (King, Snohomish, Pierce, Clark, and Thurston) are all located in western Washington, suggesting a higher concentration of EV adoption in this region. Factors such as infrastructure development, government policies, and public awareness campaigns may contribute to this regional disparity.
- While Benton and Skagit counties in eastern Washington are represented in the top 10, their adoption rates are significantly lower compared to their western counterparts. This could be attributed to various factors, including differences in population density, economic conditions, and geographic factors.
