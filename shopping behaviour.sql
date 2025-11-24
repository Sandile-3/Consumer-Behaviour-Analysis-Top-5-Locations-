show tables;
select *from `shopping_behavior_updated (1)`;

/*creating a table with only the cID,Age,Gender,Category*/
create table Cat_Analysis(
select `Customer ID`, Age, Gender, Category
from `shopping_behavior_updated (1)`);
select *from Cat_Analysis;

/*creating a table with the cID, Age, Gender, Item Purchased, Purchase Amount*/
create table Item_Analysis(
select `Customer ID`, Age, Gender, `Item Purchased`, `Purchase Amount (USD)`
from `shopping_behavior_updated (1)`);

select distinct Location 
from `shopping_behavior_updated (1)`;

select count(*) Location 
from `shopping_behavior_updated (1)`
group by Location;

/*creating a table with variables Gender, Season, Colour*/
create table seasonal_analysis(
select Gender, Color, Season
from `shopping_behavior_updated (1)`);

/*creating machine learning features: Gender, Season, Location, Item Purchased*/

select distinct `Item Purchased`, count(*)
from `shopping_behavior_updated (1)`
group by `Item Purchased`;

alter table `shopping_behavior_updated (1)` 
add column Location2 varchar(25);

SET SQL_SAFE_UPDATES = 0;
update `shopping_behavior_updated (1)`
set Location2 = case
 WHEN Location IN ('Maine', 'New Hampshire', 'Vermont', 'Massachusetts', 'Rhode Island', 'Connecticut')
        THEN 'New England'
    WHEN Location IN ('New York', 'New Jersey', 'Pennsylvania')
        THEN 'Mid-Atlantic'
    WHEN Location IN ('Ohio', 'Michigan', 'Indiana', 'Illinois', 'Wisconsin')
        THEN 'East North Central'
    WHEN Location IN ('Minnesota', 'Iowa', 'Missouri', 'North Dakota', 'South Dakota', 'Nebraska', 'Kansas')
        THEN 'West North Central'
    WHEN Location IN ('Delaware', 'Maryland', 'Virginia', 'West Virginia', 'North Carolina', 'South Carolina', 'Georgia', 'Florida')
        THEN 'South Atlantic'
    WHEN Location IN ('Kentucky', 'Tennessee', 'Mississippi', 'Alabama')
        THEN 'East South Central'
    WHEN Location IN ('Oklahoma', 'Texas', 'Arkansas', 'Louisiana')
        THEN 'West South Central'
    WHEN Location IN ('Montana', 'Idaho', 'Wyoming', 'Nevada', 'Utah', 'Colorado', 'Arizona', 'New Mexico')
        THEN 'Mountain'
    WHEN Location IN ('Alaska', 'Washington', 'Oregon', 'California', 'Hawaii')
        THEN 'Pacific'
END;

select *from `shopping_behavior_updated (1)`;

select count(*), Location2
from `shopping_behavior_updated (1)`
group by Location2;

/*creating features for ML*/
create table machine_learning(
select Gender, `Item Purchased`, Season, Location2
from `shopping_behavior_updated (1)`);

select *from machine_learning;
