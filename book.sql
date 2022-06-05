use master
create database BookLibary

use BookLibary

drop database BookLibary
go

create table Book (
BookCode int not null,
CONSTRAINT PK PRIMARY KEY (BookCode),
BookTitle varchar(100) not null,
Author varchar(100) not null,
Edition int,
BookPrice money,
Copies int,
)
select *from Book

create table MSSQL (
MemberCode int  identity not null,
CONSTRAINT PL PRIMARY KEY (MemberCode),
Name varchar(50) not null,
Address varchar(100) not null,
PhoneNumber int 
)
select *from MSSQL

ALTER TABLE MSSQL DROP COLUMN PhoneNumber 

ALTER TABLE MSSQL ADD PhoneNumber  INT NOT NULL

create table IssueDetails(
BookCode int not null,
constraint fk foreign key (BookCode) REFERENCES Book(BookCode),
MemberCode int not null,
constraint ck foreign key (MemberCode) REFERENCES MSSQL(MemberCode),
IssueDeta datetime not null,
ReturnDate datetime not null
)
select *from IssueDetails

drop table IssueDetails

alter table IssueDetails
drop CONSTRAINT fk

alter table IssueDetails
drop CONSTRAINT ck

alter table Book
drop constraint PK
ALTER TABLE Book ADD CONSTRAINT DN PRIMARY KEY(BookTitle,Author)


alter table MSSQL
drop constraint PL
ALTER TABLE MSSQL ADD CONSTRAINT DNS PRIMARY KEY(MemberCode,Name,Address)



alter table Book add ReturnDate  int not null
ALTER TABLE Book  DROP COLUMN ReturnDate

select *from Book

alter table IssueDetails
ADD CONSTRAINT fk
  FOREIGN KEY (BookCode)
  REFERENCES Book (BookCode)

alter table IssueDetails
ADD CONSTRAINT ck
  FOREIGN KEY (MemberCode)
  REFERENCES MSSQL (MemberCode)

alter table Book add CONSTRAINT CHK_RC check ( BookPrice < 200 )
alter table Book add CONSTRAINT CHK_RA check ( BookPrice > 0 )

ALTER TABLE Book ADD CONSTRAINT DNSK PRIMARY KEY(PhoneNumber)