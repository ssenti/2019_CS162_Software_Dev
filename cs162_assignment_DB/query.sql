
/* Every month the following reports need to be run:*/

/*1) Find the top 5 offices with the most sales for that month*/
select OfficeID as "March Top 5 OfficeIDs",
Sum(SalesPrice) as "Total Sales (in USD)"
from Sales where Sales.SalesDate > '2019-03-01'
group by OfficeID
order by Sum(SalesPrice) desc limit 5;

/* 2) Find the top 5 estate agents who have sold the most (include their contact
details and their sales details so that it is easy contact them and congratulate them).*/
select Sales.AgentID as "March Top 5 AgentIDs",
Sum(SalesPrice) as "Total Sales (in USD)",
AgentFirstName,AgentLastName, AgentPhoneNumber, AgentEmail
from Sales
left outer join Agent on Sales.AgentID = Agent.AgentID
where Sales.SalesDate > '2019-03-01'
group by Sales.AgentID
order by Sum(SalesPrice) desc limit 5;

/* 3) Calculate the commission that each estate agent must receive and
store the results in a separate table */
select Sales.AgentID as "March AgentIDs",
TotalCommission as "Total Commision (in USD)"
from AgentCommissionSummary
left outer join Sales on Sales.AgentID = AgentCommissionSummary.AgentID
where Sales.SalesDate > '2019-03-01'
order by Sales.AgentID;

/*4) For all houses that were sold that month, calculate the average number
of days that the house was on the market*/
select ListedHouse.ListedHouseID as "March Sold HousesIDs",
cast((julianday(SalesDate) - julianday(ListedDate)) as integer) as "Days Passed"
from ListedHouse
left outer join Sales on Sales.ListedHouseID = ListedHouse.ListedHouseID
where sold = 1 and Sales.SalesDate > '2019-03-01';

/* 5) For all houses that were sold that month, calculate the average selling price */
select cast(avg(SalesPrice) as integer) as "March Average Sales Price (in USD)"
from ListedHouse
left outer join Sales on Sales.ListedHouseID = ListedHouse.ListedHouseID
where Sales.SalesDate > '2019-03-01';

/*6) Find the zip codes with the top 5 average sales prices*/
select OfficePostalCode.OfficePostalCodeID as "March Top 5 PostalCodeIDs",
cast(avg(SalesPrice) as integer) as "Average Sales Price (in USD)"
from Sales
left outer join Office
on Office.OfficeID = Sales.OfficeID
left outer join OfficePostalCode
on OfficePostalCode.OfficePostalCodeID = Office.OfficePostalCodeID
where Sales.SalesDate > '2019-03-01'
group by OfficePostalCode.OfficePostalCodeID
order by Avg(SalesPrice) desc limit 5;
