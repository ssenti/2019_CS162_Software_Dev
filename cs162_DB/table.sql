
.mode column
.headers on
PRAGMA foreign_keys = ON;

/*All of the tables here should satisfy the three levels of
Database Normalization:
1) Each column contains atomic values, and there are no repeating columns.
2) All of the columns depend on the table's primary key.
3) All of the columns are not transitively dependent on the primary key.*/

create table Sales(
	SalesID integer primary key,
	BuyerID integer,
	OfficeID integer,
	ListedHouseID integer,
	AgentID integer,
	SalesPrice integer,
	SalesDate datetime,
	foreign key (BuyerID) references Buyer(BuyerID),
	foreign key (ListedHouseID) references ListedHouse(ListedHouseID),
	foreign key (AgentID) references Agent(AgentID),
	foreign key (OfficeID) references Office(OfficeID)
);

create table AgentCommission(
	AgentID integer,
	Commission numeric(8,2),
	foreign key (AgentID) references Agent(AgentID)
);

create table AgentCommissionSummary(
	AgentID integer primary key autoincrement,
	TotalCommission numeric(8,2),
	CountCommission integer,
	foreign key (AgentID) references Agent(AgentID)
);

create table Agent(
	AgentID integer Primary Key,
	AgentFirstName text,
	AgentLastName text,
	AgentPhoneNumber integer,
	AgentEmail text,
	AgentAge integer,
	AgentEmploymentDays integer
);

create table Buyer(
	BuyerID integer Primary Key,
	BuyerFirstName text,
	BuyerLast Name text,
	BuyerPhoneNumber integer,
	BuyerEmail text
);

create table ListedHouse(
	ListedHouseID integer Primary Key,
	Sold boolean,
	SellerID integer,
	AgentID integer,
	HousePostalCode integer,
	HouseNumber integer,
	BedroomCount integer,
	BathroomCount integer,
	ListedPrice integer,
	ListedDate datetime,
	foreign key (SellerID) references Seller(SellerID),
	foreign key (AgentID) references Agent(AgentID)
);

create table Office(
	OfficeID integer Primary Key,
	OfficePostalCodeID integer,
	foreign key (OfficePostalCodeID) references OfficePostalCode(OfficePostalCodeID)
);

/* I have separated OfficePostalCode from Office to ensure Database Normalization
*/
create table OfficePostalCode(
	OfficePostalCodeID integer Primary Key,
	OfficeCity text
);

create table Seller(
	SellerID integer Primary Key,
	SellerFirstName text,
	SellerLastName text,
	SellerPhoneNumber integer,
	SellerEmail text
);
