# 🗄️ AirBnB Database ERD Requirements

## 🎯 Objective
To design an Entity-Relationship Diagram (ERD) that accurately represents the structure of the AirBnB database, based on the given specification.

---

## 🧩 Entities and Relationships
The ERD should include the following entities and relationships:

### **Entities**
1. **User**
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

### **Relationships**
- A User (host) can own many Properties.
- A User (guest) can make many Bookings.
- A Property can have many Bookings and Reviews.
- A Booking has one Payment.
- A User can send and receive multiple Messages.

---

## 🧱 Attributes
Each entity should include all key attributes as defined in the database specification:
- Primary Keys (UUIDs)
- Foreign Keys
- Required fields
- Timestamps and ENUM values

---

## 🖼️ ER Diagram Deliverables
- `airbnb_erd.drawio` → Editable diagram file.  
- `airbnb_erd.png` → Exported image version for documentation.