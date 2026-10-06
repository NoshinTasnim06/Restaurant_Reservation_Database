# 🍽️ Restaurant Reservation Database (OpenTable-Style)

A relational database design for a restaurant reservation platform modeled on OpenTable. The project covers the full database lifecycle: conceptual design (ER model), logical schema, a MySQL implementation with mock data, and a set of analytical queries that answer realistic questions a diner, restaurant, or platform might ask.

> **Team project.** Built collaboratively for a university database course. The data is entirely fictional and was created for the course.

---

## Overview

The database models how diners discover restaurants, book tables, and leave feedback, and how restaurants manage their listings, menus, and availability.

**Core capabilities**

- **Users and accounts:** profiles, saved payment methods, multiple phone numbers per user, dining preferences, and saved ("favorite") restaurants.
- **Restaurant listings:** location, dining style, price range, dress code, parking, accessibility, cuisines, awards, FAQs, and tags such as "Outdoor Seating".
- **Menus:** menus, menu items, popular dishes, specials, and drink and alcohol options.
- **Reservations and availability:** reservations, service periods (breakfast, lunch, dinner), time slots, tables, and private dining rooms.
- **Offers and experiences:** promotions and special events such as tasting menus, with their available dates.
- **Reviews:** multi-dimensional ratings (food, service, ambience, overall), review tags, and restaurant responses.

## Database Design

The schema has **33 tables**, grouped by function:

| Area | Tables |
|---|---|
| Users & accounts | `user`, `payMethod`, `phoneNumber`, `Preferences`, `userPreference`, `saved` |
| Restaurants | `restaurant`, `details`, `awards`, `featuredIn`, `faqs`, `cuisine`, `restaurantCuisine`, `tag`, `RestHasTag` |
| Menus | `menu`, `menuItem`, `popularDishes`, `specials`, `drinkType`, `alcoholType` |
| Reservations & availability | `reservation`, `timeslot`, `servicePeriod`, `restaurantTable`, `privateDining`, `isAvailable` |
| Offers & experiences | `offers`, `experience`, `expDates` |
| Reviews | `review`, `ReviewHasTag`, `response` |

**Design notes**

- Multivalued attributes (phone numbers, cuisines, tags, awards, drink types) are split into their own tables.
- Many-to-many relationships use junction tables, such as `restaurantCuisine`, `RestHasTag`, `ReviewHasTag`, `userPreference`, and `isAvailable`.
- Constrained fields use `ENUM` types (dining style, price range, reservation status, and similar).
- All relationships are enforced with primary and foreign keys (InnoDB).

### Design documents

The `docs/` folder holds the original design work:

- **ER model** (`er-diagram-stage3.png`): the conceptual model from Stage 3.
- **Schema document** (`schema-stage4.pdf`): the relational schema write-up from Stage 4.

> **Note:** The final MySQL implementation refined these early designs. In particular, it moved cuisines and user preferences into their own tables and replaced direct foreign keys with junction tables. The SQL files are the source of truth.

## Sample Data

The script populates the database with mock data, including:

| Data | Volume |
|---|---|
| Users | 50 |
| Restaurants | 50, across Chicago, San Francisco, Miami, New York, and Austin |
| Tables | 450+ |
| Menu items | 150 |
| Reservations, reviews, and responses | 20 each |

> **Disclaimer:** All names, emails, phone numbers, and payment details are fictional. Card numbers are fake test values and not real payment information.

## Queries

`Stage5Queries.sql` contains 10 queries that use joins, subqueries, aggregation, and filtering:

| # | Question answered |
|---|---|
| 1 | What reviews has a given restaurant received within a date range? |
| 2 | How many reservations do American restaurants in a city have? |
| 3 | Which restaurants in a city offer tasting experiences, and at what price? |
| 4 | Which casual-dining restaurants have a reservation for a party of four at a given date and time? |
| 5 | Which restaurants with outdoor seating accept credit cards? |
| 6 | What restaurants has a given user saved, and what cuisine are they? |
| 7 | What are the average food, service, ambience, and overall ratings for fine-dining restaurants in a city? |
| 8 | Who has a reservation at a restaurant on a given day, and at which table? |
| 9 | What are all the reviews, along with any restaurant responses? (`LEFT JOIN`) |
| 10 | Which restaurants have the best performance overall (reservations, guests served, and ratings)? (`GROUP BY` / `HAVING`) |

## Getting Started

**Requirements:** MySQL 8.0+ (or compatible), and MySQL Workbench or the `mysql` command-line client.

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>
   ```

2. **Create the database and load the data.** The script creates the tables and inserts all sample data.
   ```bash
   mysql -u root -p < sql/OpenTable.sql
   ```
   > ⚠️ The script begins with `DROP DATABASE IF EXISTS OpenTable;`, so it will replace any existing database with that name.

3. **Run the queries**
   ```bash
   mysql -u root -p OpenTable < sql/Stage5Queries.sql
   ```
   You can also open the files in MySQL Workbench and run them one at a time.

## Project Structure

```
├── sql/
│   ├── OpenTable.sql          # Table definitions and sample data
│   └── Stage5Queries.sql      # 10 analytical queries
├── docs/
│   ├── er-diagram-stage3.png  # Original ER model
│   └── schema-stage4.pdf      # Original schema document
└── README.md
```

## Known Limitations

- Mock data was written by hand for the course, so it is small and uneven in places. Some restaurant address fields (`street`, `zipCode`) are empty, and some tables have only a handful of rows.
- The ER diagram and schema document reflect earlier stages and are not fully in sync with the final SQL.
- Reservation availability is modeled with tables and time slots, but no booking logic (such as preventing double-booking) is implemented. This project focuses on schema design and querying.

## Tech Stack

- MySQL (InnoDB)
- SQL: DDL, DML, joins, subqueries, aggregation

## Contributors

This was a group project completed by a team for a database course. The work was shared across all parts of the project, so individual contributions are not tracked separately.
