# Shark-Tank-Analysis

![Shark Tank Analysis Dashbaord](https://github.com/Santosh-Jayaswal/Shark-Tank-Analysis/assets/17638311/04dbd62c-c578-479d-b5b3-65607c2844c8)


This dataset is sourced from the popular Indian TV show "Shark Tank," where entrepreneurs pitch their businesses to secure funding by offering equity to investors. Investors, or "sharks," then choose to invest either individually or as a group based on the pitches they find compelling. The dataset, available on Kaggle, comprises about 43 columns and was initially uncleaned with many null values and inconsistencies. I cleaned and preprocessed the data using Python (Pandas and Numpy), exporting it in CSV format to work with both SQL and PowerBI.

**Note: The amounts in the dataset are in Indian Rupees (₹) in lakhs, which I converted to millions for easier interpretation.**

The goal is to assist entrepreneurs and future participants in understanding the appropriate amount of equity to offer and the funding to request to secure a deal. The analysis also highlights the popular industries that have attracted investment interest over the three seasons, among other insights. Above is a snapshot of the dashboard, and here is a quick detail of each file contained in the repository.

1.  **PowerBI Directory:** Contains the raw PowerBI file for the project, including the dashboard mentioned above.
2.  **MySQL Directory:** A raw SQL file required for the project.
3.  **Shark Tank Reports.pptx:** A presentation detailing the project and how it helps entrepreneurs prepare their pitches before appearing on the show.
4.  **shark_tank_india_preparation.ipynb:** A Jupyter notebook where the preprocessing stages were performed, resulting in a cleaned CSV file.
5.  **sharktank_india(clean).csv:** The cleaned dataset with the necessary columns for further analysis, used in both MySQL and PowerBI.

