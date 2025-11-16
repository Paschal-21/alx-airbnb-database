📘 Database Normalization (Up to Third Normal Form - 3NF)

This document explains how the AirBnB database schema was reviewed and normalized to ensure it satisfies First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).

The goal is to eliminate redundancy, avoid update anomalies, and maintain data integrity.

✅ 1. First Normal Form (1NF)
Requirements

A table is in 1NF if:

It has a primary key.

All attributes contain atomic (indivisible) values.

No repeating groups or arrays.

Analysis of Each Entity
User

All values are atomic (first name, last name, email, etc.).

user_id is the primary key.

No repeating groups.

Status: ✔️ Meets 1NF.

Property

All fields are atomic.

host_id references one user.

No repeating attributes.

Status: ✔️ Meets 1NF.

Booking

Atomic attributes (dates, status, total_price).

No repeating values.

Status: ✔️ Meets 1NF.

Payment

Atomic fields.

One payment per booking ensures no repeating data.

Status: ✔️ Meets 1NF.

Review

One review per user per property.

All fields atomic.

Status: ✔️ Meets 1NF.

Message

Atomic message contents.

sender_id and recipient_id are clear FK references.

Status: ✔️ Meets 1NF.

✅ 2. Second Normal Form (2NF)
Requirements

A table is in 2NF if:

It is in 1NF.

It has no partial dependency on a composite key.

Since all tables use single-column primary keys (UUIDs):

→ No partial dependencies are possible.
Status:

✔️ All tables are in 2NF automatically.

✅ 3. Third Normal Form (3NF)
Requirements

A table is in 3NF if:

It is in 2NF.

It has no transitive dependencies (non-key attribute depending on another non-key attribute).

🔍 Review of Potential Violations
1. User Table
Attribute	Depends On
email	user_id
first_name	user_id
last_name	user_id
phone_number	user_id
role	user_id

No attribute depends on another attribute.
All depend solely on user_id.

✔️ Fully in 3NF

2. Property Table

host_id is a foreign key and not derived from any property attribute.

No attribute depends on another non-key attribute.

✔️ In 3NF

3. Booking Table

No attributes depend on others:

total_price = system-generated and not stored from another table.

status depends on booking state, not on property or user.

✔️ In 3NF

4. Payment Table

No transitive dependencies.

amount does not depend on payment_method.

payment_date is atomic.

✔️ In 3NF

5. Review Table

rating does not depend on comment.

comment does not depend on property_id.

✔️ In 3NF

6. Message Table

message_body does not depend on sender or recipient.

sent_at also depends only on message_id.

✔️ In 3NF

🔄 Final Normalization Notes

After reviewing the schema:

🚫 No modifications were needed to achieve 3NF.

Your schema already exhibits:

No repeating groups (1NF)

No partial dependencies (2NF)

No transitive dependencies (3NF)

This is because the schema was well-structured from the beginning, with:

Single-Column Primary Keys (UUIDs)

Properly defined Foreign Keys

No derived or multi-valued attributes

Entities separated by clear functional responsibilities

🧾 Conclusion

The AirBnB database is fully normalized up to Third Normal Form (3NF).
This ensures:

Reduced redundancy

Improved update consistency

Better relational integrity

Clean and scalable data structure for the application