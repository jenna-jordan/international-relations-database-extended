# International Relations Database - Extended

## Introduction

This project combines datasets relevant for research in peace/conflict and international development into a country-year time series dataset. The following datasets are included: Correlates of War, UCDP/PRIO Armed Conflict, Polity IV, and World Bank World Development Indicators. An edited form of the "countrycode" package's dataframe "codelist_panel" is used to merge these datasets together.

## Navigating the Project

"Data" contains all of the data files for the project - original source files, intermediate wrangled data files, and the final dataset. All original and intermediate files are in their respective source folders. All final data files, including the final time series dataset and the files merged together to create the dataset, are in the folder "FINAL". Each of the source subfolders contain subfolders that follow the same naming structure: "Raw" contains files directly downloaded and left in their original state, and "Wrangled" contains files that result from the "raw" datasets being manipulated. The "Data" folder contains the following subfolders:

- FINAL: all final datasets to be merged together. The final time series dataset is called "final_time-series.csv"
- Other: contains files from G&W and countrycodes
- WorldBank: contains files created by accessing the World Bank API
- CShapes: contains the original shapefiles and a CSV of the shapefile attributes
- PolityIV: contains datasets from the Polity IV project
- UCDP_PRIO: contains datasets both downloaded from UCDP's website and accessed via UCDP's API
- CoW: contains datasets downloaded from the Correlates of War Project

"Documentation" contains all of the necessary documentation, including both documentation that I have written and the source datasets' original documentation. Documentation downloaded from the source datasets are contained in their respective subfolders inside the subfolder "Original".

"Gather_Data" contains the Jupyter notebooks used to gather data from the World Bank API and the UCDP API, as well as a notebook that extracts the attributes from the CShapes shapefiles. It also contains the R script used to access countrycode's "codelist_panel" dataframe.

"Wrangle_Data" contains the Jupyter notebooks used to normalize the UCDP/PRIO dataset and the CoW datasets, as well as editing the countrycode file for any errors identified while exploring discrepancies between the datasets' identifiers. The notebook for trimming the World Bank data is deprecated, as in the end I did not use the full WDI dataset but simply gathered the identified top 25 indicators.

"Mashup_Data" contains the Jupyter notebooks used to create the final dataset, including both the final time series and the notebooks that create the last intermediate data files that feed into the final time series.

"Results" contains the Jupyter notebook used to assess and explore the final time series dataset.
