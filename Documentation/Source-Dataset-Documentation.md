# Source Dataset Documentation

This file serves as documentation for all source datasets that were used to make the final mashed-up time series dataset.

### Table of Contents

- Correlates of War
- UCDP/PRIO Armed Conflict
- Polity IV
- World Bank World Development Indicators
- countrycode
- Other supplementary datasets

Note: Some datasets that are in the "Data" file were not used for the final dataset, but were explored and used during the process of completing this project. This includes the CShapes dataset and the Gleditsch & Ward (G&W) state list. The G&W microstate list was used to fill in some holes in the "countrycode" dataset. These supplementary datasets are documented in the last section.

Note: All CSV files that were not directly downloaded from a website can be assumed to have `utf-8` encoding.

## Correlates of War (CoW)

The Correlates of War is a collection of datasets that track the all wars since 1816 (at least 1,000 battle deaths) and related variables. See their [website](http://www.correlatesofwar.org/) for more information about the project. 

For this project, I focused on the 4 war datasets. The datasets I integrated into the Correlates of War database project (available [here](https://github.com/jenna-jordan/international-relations-database)) can be integrated at a later point.

### Attribution & Provenance 

Citations:

> Correlates of War Project. 2017. "State System Membership List, v2016." Online, http://correlatesofwar.org

> Sarkees, Meredith Reid and Frank Wayman (2010). Resort to War: 1816 - 2007. Washington DC: CQ Press.


License: specified [here](http://www.correlatesofwar.org/data-sets/terms-and-conditions)

### Data Collection Process

The CoW datasets are only accessible by downloading the files from the [Correlates of War website's](https://correlatesofwar.org/) [Data Sets page](https://correlatesofwar.org/data-sets). Specifically, the files were downloaded from the [COW Country Codes](https://correlatesofwar.org/data-sets/cow-country-codes), [State System Membership (v2016)](https://correlatesofwar.org/data-sets/state-system-membership), and [COW War Data, 1816 - 2007 (v4.0)](https://correlatesofwar.org/data-sets/COW-war) pages. These downloaded CSV files were saved to the directory `/Data/CoW/Raw` and were never edited. I downloaded the files in October 2019.

The following files are in `/Data/CoW/Raw`

- `Extra-StateWarData_v4.0.csv`
- `Inter-StateWarData_v4.0.csv`
- `Intra-StateWarData_v4.1.csv`
- `Non-StateWarData_v4.0.csv`
- `system2016.csv`
- `states2016.csv`
- `COW country codes.csv`

Additionally, I used [Tabula](https://tabula.technology/) to transform the PDF file `CowWarList.pdf` into a CSV file. The original PDF and transformed CSV files are available in the directory `/Data/CoW/From_PDF`.

These raw data files are fully documented in the original documentation. The original documentation pdf files are available in the directory `/Documentation/Original/CoW`

### Data Wrangling Process

In order to transform these files into a structure that I could use for my final dataset, I needed to normalize these files. I completed this normalization process using the `pandas` library in a Jupyter notebook. The notebook can be found here: `/Wrangle_Data/Normalize_CoW.ipynb`. This notebook outputs the following CSV files, which can be found in the directory `/Data/CoW/Wrangled`:

- `war_participants.csv`
- `polities.csv`
- `war_locations.csv`
- `war_transitions.csv`
- `wars.csv`

In order to add the CoW data to the final dataset, I needed to transform the data into a country-year time series. I did this using `pandas` in a Jupyter notebook that can be found here: `/Mashup_Data/Merge_CoW.ipynb`. This notebook outputs a single CSV file that can be found here: `/Data/FINAL/cow.csv`. This file contains the CoW data that is merged to make the final time-series dataset. All columns in the final dataset that come from this file are prefixed with `cow_`.

## UCDP/PRIO Armed Conflict

This dataset was jointly produced by the Department of Peace and Conflict Research at Uppsala University (UCDP) and the Centre for the Study of Civil War at the Peace Research Institute Oslo (PRIO), and records armed conflicts (with at least 25 battle deaths) since 1946. It can be found both on [PRIO's website](https://www.prio.org/Data/Armed-Conflict/UCDP-PRIO/) and [UCDP's website](https://ucdp.uu.se/downloads/index.html#armedconflict). 

### Attribution & Provenance

Citations:

> Pettersson, Therese; Stina Högbladh & Magnus Öberg, 2019. Organized violence, 1989-2018 and peace agreements, Journal of Peace Research 56(4).

> Gleditsch, Nils Petter, Peter Wallensteen, Mikael Eriksson, Margareta Sollenberg, and Håvard Strand (2002) Armed Conflict 1946-2001: A New Dataset. Journal of Peace Research 39(5).

License: not specified

### Data Collection Process

UCDP makes all files accessible both by download (in a variety of format) and by API. I used the API to get the Armed Conflict dataset, and used the `pandas` and `request` libraries in a Jupyter notebook to access the API. The notebook can be found here: `/Gather_Data/UCDP-PRIO_API.ipynb`. I collected this data first in October 2019, and then again in November 2019. The notebook outputs a CSV file, which can be found here: `/Data/UCDP_PRIO/ucdpprio_armedconflict_api.csv`. I later also directly downloaded the Armed Conflict dataset in order to compare if it was the same as the data I accessed via API (it was), as well as CSV files of the actor lists. These downloaded files can be found here: `/Data/UCDP_PRIO/Raw`. I did not end up using the actor files, because I did not use UCDP's actor codes (I used the G&W codes instead). However, I did explore them during the normalization process.

The original Armed Conflict dataset is fully documented in the original documentation. The original documentation PDF file is available in the directory `/Documentation/Original/UCDP_PRIO`.

### Data Wrangling Process

Like the CoW datasets, the first thing I did with the original Armed Conflict dataset was to normalize it. I used `pandas` to complete this process in the Jupyter notebook that can be found here: `/Wrangle_Data/Normalize_UCDP-PRIO.ipynb`. This notebook outputs the following CSV files, which can be found in the directory `/Data/UCDP_PRIO/Wrangled`:

- `observations.csv`
- `regions.csv`
- `locations.csv`
- `participants_ucdp.csv`
- `participants_gw.csv`
- `episodes.csv`
- `conflicts.csv`

In order to add the Armed Conflict data to the final dataset, I needed to transform the relevant data into a country-year time series. I again used `pandas` in the Jupyter notebook `/Mashup_Data/Merge_UCDP.ipynb`, which outputs the CSV file `/Data/FINAL/ucdp.csv`. All columns in the final dataset that come from this file are prefixed with `ucdp_`.

## Polity IV

The Polity IV dataset rates the governments of all states since 1800 on a scale from -10 (most authoritarian) to +10 (most democratic). Details on the Polity Project can be found [here](http://www.systemicpeace.org/polityproject.html).

### Attribution & Provenance

Citation:

> Monty G. Marshall, Ted Robert Gurr, Keith Jaggers (2018). POLITY IV PROJECT: Dataset Users' Manual. Center for Systemic Peace.

License: Dataset is copyrighted by the Center for Systemic Peace.

### Data Collection Process

The "Polity IV Annual Time-Series, 1800-2018" dataset was downloaded directly from [here](http://www.systemicpeace.org/inscrdata.html) as an Excel file (.xls), which was saved here: `/Data/PolityIV/Raw/p4v2018.xls`. The .xls file was opened in Excel and re-saved as a .csv (utf-8) file, which can be found here: `/Data/PolityIV/p4v2018.csv`. I downloaded this file in October 2019.

The original Polity IV dataset is fully documented in the original documentation. The original documentation PDF file is available in the directory `/Documentation/Original/PolityIV`.

### Data Wrangling Process

This dataset is already in time-series format, so I did not have to normalize or wrangle this dataset. I did, however, need to trim it so that all dates before 1946 and some extraneous variables were excluded. This process was completed in a Jupyter notebook, which can be found here: `/Mashup_Data/Trim_Polity.ipynb`. The notebook outputs a CSV file, which can be found here: `/Data/FINAL/polity.csv`. All columns in the final dataset that come from this file are prefixed with `p4_`.

## World Bank World Development Indicators

This dataset contains time series for the World Development Indicators published by the World Bank. See metadata at: https://datacatalog.worldbank.org/dataset/world-development-indicators

### Attribution & Provenance

Citation: 

> World Development Indicators, The World Bank

License: CC-BY 4.0

### Data Collection Process

I collected this data via API. The documentation for the Indicator API is [here](https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation).

First, I collected the metadata for all countries and indicators in the Indicators database. This was done in the Jupyter notebook `/Gather_Data/WB-CountriesAndIndicators_API.ipynb`. This notebook outputted the following CSV files to the directory `/Data/WorldBank/Raw_API`:

- `indicators_list.csv`
- `indicator-sources_codes.csv`
- `indicator-topics_codes.csv`
- `indicators-wdi-wtopics.csv`

- `countries_list.csv`
- `region_codes.csv`
- `adminregion_codes.csv`
- `incomelevel_codes.csv`
- `lendinglevel_codes.csv`

The JSON output from the API contained some hierarchical data, which I normalized in to the above table. The core information can be found in `indicators_list.csv` and `countries_list.csv`.

I then compared the country identifiers present in the `countries_list.csv` to the `wb` identifiers present in the `countrycode` dataset. This narrowed down list has 195 countries. 

I then decided to focus on the WDI indicators. There were 1387 indicators in the WDI collection (found in `indicators-wdi-wtopics.csv`). Initially I collected time series data on all 1387 indicators, and attempted to narrow them down by exploring them in the Jupyter notebook `/Wrangle_Data/Trim_WorldBank-WDI.ipynb`. However, while I was able to trim down the number of indicators from 1387 to 472 (determined purely by data availability), this was still too many. So, in the end I decided to focus just on a list of the top 25 indicators, as published in a [World Bank blog post](https://datatopics.worldbank.org/world-development-indicators/stories/world-development-indicators-the-story.html).

I gathered the WDI time series data using the `pandas`, `requests`, and `time` libraries in the Jupyter notebook `/Gather_Data/WB-IndicatorTimeSeries_API.ipynb`. This notebook currently only gathers the top 25 indicators for all 195 countries. However, a simple variable change in the main for loop will allow the full time series of 1387 indicators to be gathered (this is noted in the notebook). This notebook outputs the CSV file `/Data/FINAL/wdi_top25.csv`, and was gathered/created in December 2019.

The documentation for the World Bank WDI dataset is all online. I have saved the most relevant webpages as PDF files in this directory: `/Documentation/Original/WorldBank`.

### Data Wrangling Process

This dataset is already in time series format and did not need to be wrangled. A simple pivot was performed in the Jupyter notebook that produces the final dataset, resulting in each of the 25 indicators becoming a column/variable. Each variable in the final dataset that comes from the World Bank WDI collection is prefixed with `wb_`.

## countrycode

The "countrycode" R package was created by Prof. Vincent Arel-Bundock to help standardize country names and convert between different country identifier schemas. The GitHub repo for the package can be found [here](https://github.com/vincentarelbundock/countrycode).

### Attribution & Provenance

Citation: 

> Arel-Bundock, Vincent, Nils Enevoldsen, and CJ Yetman, (2018). countrycode: An R package to convert country names and country codes. Journal of Open Source Software, 3(28), 848, https://doi.org/10.21105/joss.00848

License: GPL-3.0

### Data Collection Process

Although this R package can do many things, I was interested specifically in the dataframe `codelist_panel`, which is a country-year time series and contains a wide variety of identifiers. In an R script I loaded this dataframe, filled in some gaps for the G&W microstates, and subsetted the dataframe so that all years before 1946 and all unnecessary identifiers were excluded. The R script can be found here: `/Gather_Data/Create_Country-Code-Mappings.R`. The CSV file that this script creates can be found here: `/Data/Other/country_conversion_table.csv`.

This package is fully documented both on [GitHub](https://github.com/vincentarelbundock/countrycode) and [CRAN](https://cran.r-project.org/package=countrycode).

### Data Wrangling Process

Unfortunately, even this dataset - which was created explicitly to convert between identifier schemes - is not completely correct. I explored this dataset for discrepancies with the datasets it was designed to merge and found several issues that need to be corrected. This exploration and the corrections can be found in the Jupyter notebook `/Wrangle_Data/Explore_State_Identifiers.ipynb`. This notebook outputs the corrected time series of country identifiers to a CSV file, which can be found here: `/Users/jenna/Documents/GitHub/international-relations-database-extended/Data/FINAL/countrycodes_ts-base.csv`.

## Other Supplementary Datasets

The following datasets are in this repository and referenced/used in the Jupyter notebooks, but are not used to create the final dataset:

- CShapes
- G&W States
- G&W Microstates

### CShapes

CShapes provides the historical boundaries for states according to both the Correlates of War and the Gleditsch and Ward (1999) state lists. Where these state lists overlap, a single shape is provided. Where these state lists differ, two shapes are provided - one for each. ISO codes are also provided. CShapes can be found on Nils Weidmann's website [here](http://nils.weidmann.ws/projects/cshapes.html).

#### Attribution & Provenance

Citation: 

> Weidmann, Nils B., Doreen Kuse, and Kristian Skrede Gleditsch. 2010. The Geography of the International System: The CShapes Dataset. International Interactions 36 (1).

License: CC-BY-NC-SA 4.0

#### Data Collection Process

This dataset (cshapes_0.6.zip) was downloaded from [this webpage](http://downloads.weidmann.ws/cshapes/Shapefiles/) in October 2019. It can be found in this directory: `/Data/CShapes/Raw/cshapes_0.6`. The shapefile attributes were extracted in this notebook: `/Gather_Data/CSHAPES_extract-attributes.ipynb` and saved here: `/Data/CShapes/Raw/country_shapes.csv`.

### Gleditsch & Ward

The G&W state system is the other primary state identifier scheme used by political scientists (besides CoW). The original files - both the state list and the microstate list - can be found on Kristian Skrede Gleditsch's website, [here](http://ksgleditsch.com/data-4.html), as `.dat` files.

#### Attribution & Provenance

Citation: 

> Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate System Membership: A Revised List of the Independent States since 1816." International Interactions 25: 393-413.

License: not specified

#### Data Collection Process

The files `http://ksgleditsch.com/data/iisystem.dat` and `http://ksgleditsch.com/data/microstatessystem.dat` were downloaded in November 2019 and saved in the directory `/Data/Other`. They were then combined and converted into a CSV file (`gw_codes.csv`) in the Jupyter notebook `/Wrangle_Data/Explore_State_Identifiers.ipynb`.
