# Database Schema – Airbnb Clone (SQL)

This folder contains the SQL schema definition for the **Airbnb Clone Database**, based on the official project specification.

---

## 📌 Overview

The goal of this script is to define all database tables, constraints, and relationships required for the backend system. It includes:

- Entity tables (Users, Properties, Bookings, etc.)
- Primary keys using UUIDs
- Foreign key constraints
- ENUM-like constraints using CHECK
- Indexes for performance
- Timestamps for auditing

---

## 📂 Files Included

### **schema.sql**

Contains SQL statements for:

- Creating all tables
- Adding indexes
- Defining primary/foreign keys
- Applying data validity constraints

---

## 🗂 Entities Defined

The following entities are implemented:

1. **Users**
2. **Properties**
3. **Bookings**
4. **Payments**
5. **Reviews**
6. **Messages**

Each table includes:

- UUID primary keys  
- Appropriate data types  
- NOT NULL constraints  
- CHECK constraints for ENUM behavior  
- Cascading foreign keys  

---

## 🚀 How to Run the Schema

Make sure you have PostgreSQL installed, then run:

```bash
psql -U postgres -d airbnb_db -f schema.sql