# Dataset Documentation: Polity IV

Jenna Jordan
03 November 2019

## Description

The Polity IV dataset rates the governments of all states since 1800 on a scale from -10 (most authoritarian) to +10 (most democratic). Details on the Polity Project can be found [here](http://www.systemicpeace.org/polityproject.html).

## Attribution & Provenance

Citation:
Monty G. Marshall, Ted Robert Gurr, Keith Jaggers (2018). POLITY IV PROJECT: Dataset Users' Manual. Center for Systemic Peace.

License: Dataset is copyrighted by the Center for Systemic Peace.

## Data Cleaning Assessment

The countries are identified by their CoW IDs, which makes merging the data in easier. The data is available in both time-series format (polity-year units) and the more condensed original format (polity units), which is very convenient. The only "cleaning" required will be selecting which variables are needed, along with transforming any dates into datetime objects.

## Data Collection Process

Datasets were downloaded directly from [here](http://www.systemicpeace.org/inscrdata.html) as an Excel file (.xls). The .xls file was opened in Excel and re-saved as a .csv (utf-8) file.

## Data Structure

File format: Excel (.xls), CSV

Entities: polities (states)

### Dimensions

Number of Records (rows):
Number of Attributes (columns):
Datatypes present:

## Codebook

| Name | Description | Datatype | % Missing | 
| --- | --- | --- | --- |
| | | |

### Missing Values
