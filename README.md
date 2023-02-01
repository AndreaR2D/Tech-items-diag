# Tech-items-diag

Tech items reparation analysis. Based on Jean Milpied "Reparator.ai" project: https://github.com/JeanMILPIED/reparatorAI


## Tools used
Excel, PowerBI, DBeaver


## Data Profiling

This dataset provide a list of reparation tickets for tech items, such as: Hair Dryers, Smartphones, Coffee maker, Laptop ...


Before cleaning:

> 17 Columns;
> 62 100 records

After cleaning:

> 19 Columns;
> 62087 records

Data Types:

> * INT: year_of_manufacture; product_age
> * String: [Row_ID; Duplicate; id; data_provider;	country; partner_product_category; Partner_Category; product_category; product_category_id;	brand; repair_status;	repair_barrier_if_end_of_life; group_identifier;	problem; product_category_new; brand_ok]
> * Date: Event_Date


## Data cleaning

#### List of the data errors and how I've cleaned it
* Accents UTF-8: ANSII encoding with Notepad++
* Deleting 11 rows with too much missing data
#### Fields cleaning
* Renamed the unamed fied as "Row_ID"
* **Partner product category** = splitted the 2 parts -> New Column "Partner_Category". Lots of missing values / errors in the new column
* **Brands** = Missing values replaced by "Unknown" and manual standardisation of known brands (search & replace). I will only use legit famous brands names, because there are too much error remaining in this field. A proper cleaning involve a 
* **Year of manufacture** =
  * Converted as a integer
  * Outliers: Printer created in 1015 by HP ? 🤨 Before 1950 I've only kept watches, lamp, sewing machine. For the other rows (77) I've deleted year and age
* **Product age** = Converted as integer
* **repair_barrier_if_end_of_life** = Status standardisation
* **group Identifier** = 
  * 612 Null values all From "Fixit clinic" data provider. After some research it appears Fixit clinic is a Pop-up Activity, It's not a genuine shop: https://fixitclinic.blogspot.com/ 
  * The Id's are either a number or a text. Texts are countries mostly, so I assume this ID is a shop location
* **Event date** = 
  * 4 Rows deleted with missing values
  * 15 event_date are in 1999 from repair cafe intl. Those dates are wrong as Repair Cafes were created in 2009 by Martine Postma: https://www.repaircafe.org/en/about/
* **Problem** = Problem description. I didn't cleaned this field and will not used it in my analysis. Multiple languages used (EN; FR; NL; DE; IT)
* **Product category_new and brand_ok** = Useless fields. I didn't cleaned this field and will not use it in my analysis.

#### Duplicates
A duplicate is defined by: 
* Same: date, problem, Partner_category, product_category, brand, repair status and group_identifier
* Row_IDs following

**-> Results = 1599 duplicates** 
Since I don't have the context, I left them in the dataset and create a special field to distinguish them.

I've used SQL to detect duplicates. The SQL script is provided in the repo.

## Exploratory analysis

* Overall stats for tickets, brands, countries, shops
* tickets: Over the years, status
* Shop: Performance on repairability, country, most repaired item
* Country: Performance on repairability, most repaired item


### Sampling
For brand analysis

