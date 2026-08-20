# ATM Transaction Ledger Database System

A relational SQL database designed to track and manage retail bank ATM accounts, customer balances, and transaction histories. Built using PostgreSQL to demonstrate foundational data science skills in data modeling, relational constraints, and ledger auditing.

## 🛠️ Core Technical Features
* **Relational Database Design:** Normalization of Customer records, Accounts, and transactional ledgers using Primary and Foreign Keys (`REFERENCES`).
* **Data Integrity Rules:** Applied safety checks (`CHECK`, `NOT NULL`, `UNIQUE`) to prevent dirty entries, invalid transaction types, or negative overdraft anomalies.
* **Cascading Operations:** Automated cleanup using `ON DELETE CASCADE` rules to mirror professional database lifecycle management.

## 📊 Database Blueprint Schema
The ledger structure consists of three connected tables:
1. `customers` (Handles client profile information)
2. `accounts` (Manages banking financial balances and account types)
3. `atm_transactions` (Records immutable historical transaction feeds)

## 🔍 Verification & Local Execution Proof
This database blueprint was successfully deployed and verified inside **pgAdmin 4** using local PostgreSQL servers. 

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/1be6157c-8262-41a5-b428-c9f73c55444a" />

