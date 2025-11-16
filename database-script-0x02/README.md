# Sample Data (Seed Script) – Airbnb Clone Database

This directory contains SQL scripts used to populate the Airbnb Clone database with **realistic sample data** for development and testing.

---

## 📄 Files Included

### **seed.sql**
Populates the database with sample records for:

- Users  
- Properties  
- Bookings  
- Payments  
- Reviews  
- Messages  

The script uses:

- UUID-based primary keys  
- Valid foreign key references  
- Realistic booking dates, prices, and user scenarios  

---

## 🧪 What the Sample Data Contains

### ✔ Users  
Includes guests, hosts, and an admin.

### ✔ Properties  
Each hosted by real users from the Users table.

### ✔ Bookings  
Multiple bookings created by different users.

### ✔ Payments  
Automatically linked to confirmed bookings.

### ✔ Reviews  
Guests leave feedback on properties they stayed in.

### ✔ Messages  
Simulates guest–host communication.

---

## 🚀 How to Run

Make sure your database has the schema created first (schema.sql).  
Then run:

```bash
psql -U postgres -d airbnb_db -f seed.sql