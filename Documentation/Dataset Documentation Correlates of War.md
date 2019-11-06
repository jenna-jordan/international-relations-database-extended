# Dataset Documentation: Correlates of War

Jenna Jordan
03 November 2019

## Description

The Correlates of War is a collection of datasets that track the all wars since 1816 (at least 1,000 battle deaths) and related variables. See their [website](http://www.correlatesofwar.org/) for more information about the project. 

For this project, I will be focusing on the 4 war datasets and the MID (militarized interstate disputes) datasets. The datasets I integrated into the Correlates of War database project (available [here](https://github.com/jenna-jordan/international-relations-database)) can be integrated at a later point.

## Attribution & Provenance

Citations:
Correlates of War Project. 2017. "State System Membership List, v2016." Online, http://correlatesofwar.org
Sarkees, Meredith Reid and Frank Wayman (2010). Resort to War: 1816 - 2007. Washington DC: CQ Press.
Palmer, Glenn, Vito D'Orazio, Michael R. Kenwick, and Roseanne W. McManus. Forthcoming. “Updating the Militarized Interstate Dispute Data: A Response to Gibler, Miller, and Little.” International Studies Quarterly.

License: specified [here](http://www.correlatesofwar.org/data-sets/terms-and-conditions)

## Data Cleaning Assessment

For the 4 war datasets, I have already performed the necessary cleaning and normalization for the CoW database project. I will likely re-use (and perhaps update) this code.

However, I have not yet worked with the MID datasets. I chose to include these datasets because the MID datasets are CoW's answer to UCDP/PRIO's criticisms of the original War datasets, and if my goal is to create a mapping between CoW and UCDP/PRIO, I would be remiss to exclude the MIDs. Some of the basic cleaning will be the same as the War datasets - replacing missing value codes with actual Null values, creating columns with datetime objects out of the year/month/day columns, dropping unnecessary columns etc.

One item of note is that each of the MIDs within a certain time period have a narrative. These narratives are contained in tables in PDF files. I will use Tabula to turn these into actual CSV files (yay Tabula!), and then will need to clean up the text in these csv files (such as removing the annoying \r characters, concatenate the tables together, and make sure they can be merged with the MID tables.

## Data Collection Process


## Data Structure

File format:

Entities: 

### Dimensions

Number of Records (rows):
Number of Attributes (columns):
Datatypes present:

## Codebook

| Name | Description | Datatype | % Missing | 
| --- | --- | --- | --- |
| | | |

### Missing Values
