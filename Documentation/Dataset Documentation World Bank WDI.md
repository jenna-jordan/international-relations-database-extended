# Dataset Documentation: World Bank WDI

Jenna Jordan
03 November 2019

## Description

This dataset contains time series for the World Development Indicators published by the World Bank. See metadata at: https://datacatalog.worldbank.org/dataset/world-development-indicators

## Attribution & Provenance

Citation: World Development Indicators, The World Bank
License: CC-BY 4.0

## Data Cleaning Assessment

There are almost 1400 indicators in the WDI collection. The primary cleaning task is in identifying which of these indicators to actually incorporate into the final dataset. There are two possible approaches to this: first, to use a pre-existing list of recommended indicators, and second, to find the indicators that provide the best coverage of both countries and years.

I explored the WDI dataset and took both of these approaches in the Jupyter notebook titled "WorldBank_WDI_narrow-down.ipynb" (in the Wrangle_Data folder). 

The narrow down approach resulted in 472 indicators (34% of the original dataset, which had 1387 indicators). Each of these indicators must have some data since at least 1970 (earliest possible year is 1960, and a large number of indicators started in 1870) and must cover (on average) at least 100 countries for every year that data is provided (some indicators are only provided every 5 years).

The World Bank has provided a list of the top 25 WDI indicators [here](https://datatopics.worldbank.org/world-development-indicators/stories/world-development-indicators-the-story.html), and this list was used to trim down the dataset according to recommended indicators.

Some minor cleaning was done to the data that was accessed via API - the variables "scale", "unit", and "obs_status" had no values, so these were dropped. 

Missing data is a major issue for this dataset. I will need to figure out the best way to deal with this missing data before conducting any analyses.

## Data Collection Process

I collected this data via API. The documentation for the Indicator API is [here](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation).

First, I collected the metadata for all countries and indicators in the Indicators database. This was done in the Jupyter notebook titled "WB_CountriesAndIndicators_API.ipynb" (in the Gather_Data folder). 

I then compared the country identifiers (ISO Alpha3) present in the Indicators database to the country identifiers (ISO Alpha3) present in the CShapes dataset (which maps CoW and G&W state identifiers, and also helpfully includes the ISO identifiers). This narrowed down list has 193 countries.

I then decided to focus on the WDI indicators (there were 1387 indicators in this collection).

The country and indicator identifiers were used to construct the URLs needed to query the database via the API. A total of 70 URLs were constructed, each with all 193 countries and 20 indicators. This was done in the Jupyter notebook titled "WB_IndicatorTimeSeries_API.ipynb" (in the Gather_Data folder).

The queried json data was then flattened and turned into a Pandas dataframe. This dataframe was then exported to csv file and saved in the Data/WorldBank folder.

## Data Structure

File format: csv

Entities: States, Indicators

### Dimensions

Number of Records (rows):
Number of Attributes (columns):
Datatypes present:

## Codebook

| Name | Description | Datatype | % Missing | 
| --- | --- | --- | --- |
| | | |

### Missing Values
