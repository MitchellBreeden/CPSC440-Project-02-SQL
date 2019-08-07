# Project 02 - CPSC 440
In this project, you will create a database and database objects to model and support ticket sales for a theater production. Your one and only deliverable will be a SQL file consisting entirely of your code, in plain text. It must run on a PostgreSQL database as a complete script.
Start this assignment by looking at the color diagram at the very bottom of the document. This is a graph of seats as laid out in a theater. Your SQL code will create tables to store information relating to these seats, along with tickets and private and public customer data.
This ERD shows the required tables and their relationships :
Requirements:
1. DROP then CREATE a SCHEMA named private. Use cascade and if exists so that the commands succeed no matter the starting state of the database. Only specified tables will be placed in the private schema.
All tables with be in the public schema unless otherwise specified. You do not need to create public as it already exists by default in the postgres database.
As you create tables, select appropriate types for all columns. Variable-length text should be text, while fixed 1 or 2 character fields should be char(1) or char(2). IDs should be int unless otherwise specified. Use timestamp for performance dates and times.
2. CREATE TABLES SeatRow and SeatNum to hold lists of all seat rows and numbers. SeatRow should have one column called row holding values A through R and AA,BB...HH. SeatNum should have one column called num holding values 1-15 and 101-126. PK
3. CREATE TABLE Seat with columns SeatRow, SeatNumber, Section, Side, PricingTier, and Wheelchair. Use not null and check to constrain values where and if appropriate. Use the SeatRow and SeatNumber as a composite PK. Put these two columns into two FKs referencing the previous tables' columns.
4. INSERT INTO Seat to populate it with the following:
1. All seats are shown in the illustration in the appendix below. Use this as a guide. 2. Side holds values ‘Right’, ‘Middle’, or ‘Left’.
  
 3. Section holds values ‘Balcony’ or ‘Main Floor’.
4. PricingTier is shows by the color codes and holds values ‘Upper Balcony’, ‘Side’, or
‘Orchestra’.
5. Wheelchair and Handicapped seating occupy rows PQR, numbers 109-122. These 42
entries should be marked Wheelchair=true. All others seats have Wheelchair=false.
6. There is no Row I (the letter after H).
7. There are 805 seats in the theater. SELECT COUNT(*) should reflect this.
8. You can use tricks to make this easier. Seat table population can be accomplished with
INSERT INTO SEAT SELECT... using Row/Num table joins and filters.
9. You can also do quite a bit of work by using UPDATE and exploiting patterns in seat
numbering and sections. For example, even numbers over 100 are always on the right. SQL supports the modulo operator (100%2 = 0) for checking odds/evens.
5. CREATE TABLE Customer (in the public schema) with columns CustomerID (PK), FirstName, and LastName.
6. CREATE TABLE Customer (in the private schema) with columns CustomerID (PK) and CreditCard (bigint). Make CustomerID an FK referencing the public Customer table.
7. CREATE TABLE Ticket with columns TicketNumber, CustomerID, SeatRow, SeatNumber, and ShowTime. Generate ticket numbers automatically using the “serial” data type, and make it the primary key. Create a constraint ensuring that the no two tickets sell the same seat for the same show (unique composite seat row, seat number, show time). Make CustomerID an FK referencing the public Customer table.
8. INSERT INTO tables public Customer, private Customer, and Ticket some data to show that Mike Johnson (Customer ID of 1234) has bought tickets for Row A, Numbers 6, 8, 10, and 9 for a show on Dec 15 2017 at 2:00pm. He used a credit card with number 1234 5678 8765 4321. You will need several INSERT statements to accomplish this.
Appendix 1: Phi Beta Kappa Memorial Hall

 
