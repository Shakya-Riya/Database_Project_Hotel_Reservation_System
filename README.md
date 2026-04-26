# Hotel Reservation System Database

## Project Overview

This project is a relational database system designed for managing hotel reservations. It was developed as part of the B103 Databases & Big Data individual project.

The database manages key hotel operations, including customer records, room details, room types, bookings, staff members, payments, and additional hotel services. The system is implemented using MySQL and demonstrates database design, normalization, constraints, relationships, CRUD operations, joins, aggregations, and reporting queries.

## Project Domain

The selected domain is a Hotel Reservation System.

This domain was chosen because hotel operations involve multiple related entities. Customers make bookings, rooms belong to room types, bookings are linked to payments, and customers may use extra services during their stay. These relationships make the topic suitable for relational database design.

## Main Features

- Store and manage customer information
- Store room types and room details
- Track room availability and room status
- Create and manage hotel bookings
- Record booking payments
- Track staff members responsible for bookings
- Manage additional hotel services
- Generate reports for bookings, revenue, occupancy, services, and invoices

## Database Management System

The project uses:

- MySQL
- MySQL Workbench

## Database Tables

| Table Name | Description |
|---|---|
| `customers` | Stores customer personal and contact details |
| `room_types` | Stores room categories, prices, and capacities |
| `rooms` | Stores individual hotel rooms and their status |
| `staff` | Stores hotel staff information |
| `bookings` | Stores customer reservation details |
| `payments` | Stores payment records linked to bookings |
| `services` | Stores additional hotel services |
| `booking_services` | Junction table connecting bookings and services |

## Entity Relationships

The main relationships in the database are:

- One customer can make many bookings.
- One room type can apply to many rooms.
- One room can be used in many bookings over time.
- One staff member can manage many bookings.
- One booking can have multiple payments.
- One booking can include multiple services.
- One service can be used in multiple bookings.

The many-to-many relationship between bookings and services is handled using the `booking_services` junction table.

## How to Run the Project

### Step 1: Open MySQL Workbench

Open MySQL Workbench and connect to your local MySQL server.

### Step 2: Create the Database and Tables

Open and run the following file:

```text
database/01_create_tables.sql
```

This script creates the database, tables, primary keys, foreign keys, constraints, and indexes.

### Step 3: Insert Sample Data

Open and run the following file:

```text
database/02_insert_sample_data.sql
```

This script inserts sample records for customers, rooms, bookings, payments, staff, and services.

### Step 4: Run Demonstration Queries

Open and run the following file:

```text
database/03_queries.sql
```

This script contains the queries used to test and demonstrate the database functionality.

## Main Query Reports

The project includes queries for:

- Viewing available rooms
- Viewing complete booking details
- Calculating revenue by payment method
- Finding unpaid or partially paid bookings
- Viewing services used by customers
- Generating room occupancy reports
- Creating full booking invoice reports
- Updating room or booking status

## Data Integrity

The database uses several constraints to maintain reliable data:

- Primary keys uniquely identify records.
- Foreign keys maintain relationships between tables.
- Unique constraints prevent duplicate emails, room numbers, room types, and service names.
- Check constraints prevent invalid values such as negative prices or invalid booking dates.
- Cascading delete rules remove dependent records where appropriate.

## Normalization

The database follows normalization principles:

- First Normal Form: Each field stores atomic values.
- Second Normal Form: Non-key attributes depend on the primary key of their table.
- Third Normal Form: Repeated and indirectly dependent data is separated into related tables.

This structure reduces duplication and improves data consistency.

## ER Diagram

```text
er_diagram.png
```

## Author

**Student Name:** Riya Shakya 
**Student ID:** GH1042882  
**Module:** B103 Databases & Big Data  
**University:** Gisma University of Applied Sciences  

## Future Improvements

The database can be extended in the future with:

- Automatic room availability checking
- Customer login system
- Staff authentication
- Refund handling
- Cancellation fee calculation
- Customer loyalty points
- Web-based user interface
