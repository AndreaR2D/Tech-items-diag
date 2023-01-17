# Tech-items-diag

Tech items reparation analysis. Based on Jean Milpied "Reparator.ai" project: https://github.com/JeanMILPIED/reparatorAI


## Tools used
Excel, PowerBI


## Data Profiling

This dataset provide a list of reparation tickets for tech items, such as: Hair Dryers, Smartphones, Coffee maker, Laptop ... and the reparation status


Before cleaning:

> 17 Columns;
> 62 100 records

After cleaning:

> xx Columns;
> xxxxx records

Data Types:

> * INT: 
> * String: 
> * Date: 
> * Float: 


## Data cleaning

#### List of the data errors and how I've cleaned it
* Accents UTF-8: ANSII encoding with Notepad++
* Deleting 11 rows with too much missing data
* Renamed field A in "Row_ID"
* Partner product category = splitted the 2 parts => New Column "Partner_Category". Lots of missing values / errors in the new column
* Brands = Manual standardisation (search & replace) of know brands dans missing values replaced by "Unknown"
* Year of manufacture et Product age = Converted as integer
* repair_barrier_if_end_of_life = Status standardisation
* group Identifier = 612 Null values all From "Fixit clinic" data provider. After some research Fixit clinic are Pop-up Activity, they are not a genuine shop https://fixitclinic.blogspot.com/ 
* Event date = 4 Rows deleted with missing values also 15 event_date are in 1999, I've left them in 1999
* Problem = Problem description. I didn't cleaned this field and will not used it in my analysis.
* Product category_new and brand_ok = Useless fields. I didn't cleaned this field and will not used it in my analysis.

## Sampling
