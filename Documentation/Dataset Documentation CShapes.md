# Dataset Documentation: CShapes

Jenna Jordan
03 November 2019

## Description

CShapes provides the historical boundaries for states according to both the Correlates of War and the Gleditsch and Ward (1999) state lists. Where these state lists overlap, a single shape is provided. Where these state lists differ, two shapes are provided - one for each. ISO codes are also provided.

## Attribution & Provenance

Citation: 
Weidmann, Nils B., Doreen Kuse, and Kristian Skrede Gleditsch. 2010. The Geography of the International System: The CShapes Dataset. International Interactions 36 (1).

License: CC-BY-NC-SA 4.0

## Data Cleaning Assessment

The unit for the original dataset is the shape - so while mapping between state identifiers is provided when those shapes match, it is not provided for conflicts. Also, a new shape is provided anytime the borders of the state change. My primary interest in this dataset is in the mapping between the CoW and the G&W state identifier schemas (as well as the ISO Alpha3 code). The cleaned up dataset should have three columns: CoW_ID, GW_ID, and ISO_ID, with no duplicates. In some cases, this may require judgement calls. These will need to be documented and based on existing solutions. For example, Andreas Beger has released the R package "states" (documentation [here](https://www.andybeger.com/states/)) which attempts to solve this problem and has documented the decisions he has made.

## Data Collection Process

The most recent zipped shapefile was downloaded from [here](http://downloads.weidmann.ws/cshapes/Shapefiles/). 

I then used the python "shapefile" library to extract the attributes from the shapefiles, collected the attributes together in a Pandas dataframe, and exported the table to a csv file. This was done in the Jupyter notebook titled "CSHAPES_extract-attributes.ipynb" (in the Gather_Data folder).

## Data Structure

File format: Shapefile (.shp, .shx, .dbf, .prj); CSV

Entities: States (by boundary shape)

### Dimensions

Number of Records (rows):
Number of Attributes (columns):
Datatypes present:

## Codebook

| Name | Description | Datatype | % Missing | 
| --- | --- | --- | --- |
| | | |

### Missing Values
