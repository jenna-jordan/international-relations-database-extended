# International Relations Database - Extended

## Context: a brief note

In Fall/Winter of 2018, I started a project to transform the Correlates of War datasets into one cohesive project. This is an extension of that project - incorporating other datasets commonly used in IR scholarship as well as the linked open data source Wikidata.

For the original Correlates of War Database, please see the folder "OriginalProject_CoW_only" or visit the github project at: https://github.com/jenna-jordan/international-relations-database

## Introduction

This project combines various datasets that are the gold standard for political science research in conflict and international development with the linked open data source Wikidata. By linking the entities in the traditional datasets (e.g. countries, conflicts) with entities in Wikidata, the traditional datasets can be augmented, fact-checked, and contextualized. As a result of expanding these datasets, I hope to be able to use more modern data analysis techniques in order to investigate what factors may contribute to a country falling into violent conflict.

My starting point for this project is a relational database I built for the Correlates of War datasets. The Correlates of War datasets are then augmented by the UCDP/PRIO Armed Conflict dataset. The vast majority of peace and conflict research uses either one or both of these datasets - the Correlates of War is used more for larger wars and interstate conflict, and stretches back to 1816, while the UCDP/PRIO dataset is used more for smaller wars and intrastate conflict, and only goes back to 1946.

For international development indicators, I then incorporate the World Bank DataBank and data from Gapminder. For scoring governments as democratic or authoritarian, I incorporate the Polity IV project. These 5 data sources are all commonly found in the political science literature. Some of these data sources are only available by downloading the csv file from a website, while others are accessible via an API (UCDP/PRIO, World Bank DataBank).

The biggest challenge to incorporating WikiData is entity matching, as different datasets have different criteria and definitions for the same entity type. For example, the Correlates of War and UCDP/PRIO use different definitions of war (Correlates of War has a higher threshold for number of deaths), and they also disagree about the start and end dates for various states (e.g. when a state became an independent actor in the international system after fighting for independence). This is where the CShapes dataset comes in handy. In addition to providing the polygons necessary to visualize this data, each state has 6 different identifiers: a Correlates of War code, a UCDP/PRIO (or G&W) code, and 4 different ISO codes. These ISO codes provide the necessary link for matching countries to Wikidata entries. Matching the individual conflicts, however, is a much more difficult task.

## Data Sources

### 1: Correlates of War

Dataset Names:

 - State System Membership v2016
 - COW War Data v4.0
 - National Material Capabilities v5.0
 - Formal Alliances v4.1
 - Territorial Change v5
 - Direct Contiguity v3.2
 - Intergovernmental Organizations v2.3

Attribution: Correlates of War Project

Access:
 - http://www.correlatesofwar.org/data-sets
 - https://github.com/jenna-jordan/correlates-of-war-database

### 2: UCDP/PRIO

Dataset name: UCDP/PRIO Armed Conflict Dataset

Attribution: Uppsala Conflict Data Program (UCDP) and Peace Research Institute Oslo (PRIO)

Access:
 - https://ucdp.uu.se/downloads/#d3
 - UCDP API: https://ucdp.uu.se/apidocs/

### 3: Polity IV

Dataset name: Polity IV Project, Political Regime Characteristics and Transitions, 1800-2018

Attribution: Center for Systemic Peace (CSP)

Access: http://www.systemicpeace.org/inscrdata.html

### 4: CShapes

Dataset name: CShapes

Attribution: Nils Weidmann

Access: http://nils.weidmann.ws/projects/cshapes/shapefile.html

### 5: Wikipedia/Wikidata

Dataset name: N/A

Attribution: Wikidata

Access: https://query.wikidata.org/ (API)

### 6: World Bank Databank

Dataset name: World Bank Indicators

Attribution: The World Bank DataBank

Access: http://api.worldbank.org/v2/ (API)

### 7: Gapminder

Dataset name: Gapminder World

Attribution: Gapminder

Access: https://www.gapminder.org/data/
