# Dataset Documentation: UCDP/PRIO Armed Conflict

Jenna Jordan
03 November 2019

## Description

This dataset was jointly produced by the Department of Peace and Conflict Research at Uppsala University (UCDP) and the Centre for the Study of Civil War at the Peace Research Institute Oslo (PRIO), and records armed conflicts (with at least 25 battle deaths) since 1946.

## Attribution & Provenance

Citations:
Pettersson, Therese; Stina Högbladh & Magnus Öberg, 2019. Organized violence, 1989-2018 and peace agreements, Journal of Peace Research 56(4).
Gleditsch, Nils Petter, Peter Wallensteen, Mikael Eriksson, Margareta Sollenberg, and Håvard Strand (2002) Armed Conflict 1946-2001: A New Dataset. Journal of Peace Research 39(5).

License: not specified


## Data Cleaning Assessment

This dataset is organized a little bit differently - the unit of observation is a conflict "episode". Each conflict has an identifier, and each conflict can have multiple episodes. However, the individual episode does not have an identifier. Some wrangling will be necessary to turn this into a country-year time series format. 

Two identifiers are provided for states - the G&W state identifier and the UCDP Actor ID. This is okay, because UCDP provides a separate file that lists all of the actors (ID, short name, and long name). What is less okay is that the columns for states may be multivalued - if multiple actors are involved on the same side, their identifiers are listed in a comma-separated string. 

In order to clean this dataset, I am going to have to do the same thing I did with the Correlates of War - normalize and make this single table a set of relational tables. This will involve assigning each episode an identifier (likely the conflict ID + episode #) and tracing out the functional dependencies for each column. Only after normalizing will I be able to put it back together to form a time series.

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
