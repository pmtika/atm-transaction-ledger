-- 1. Create the Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    account_status VARCHAR(10) DEFAULT 'Active'
);

-- 2. Create the Accounts Table (Linked to Customers)
CREATE TABLE accounts (
    account_number VARCHAR(10) PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    account_type VARCHAR(15) CHECK (account_type IN ('Savings', 'Current')),
    balance DECIMAL(15, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the ATM Transactions Table (Linked to Accounts)
CREATE TABLE atm_transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_number VARCHAR(10) REFERENCES accounts(account_number) ON DELETE CASCADE,
    transaction_type VARCHAR(15) CHECK (transaction_type IN ('Deposit', 'Withdrawal')),
    amount DECIMAL(12, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Insert Realistic Sample Data for Bank Testing
INSERT INTO customers (first_name, last_name, phone_number) VALUES
('Peter', 'Mtika', '+265888123456'),
('Grace', 'Phiri', '+265999654321');

INSERT INTO accounts (account_number, customer_id, account_type, balance) VALUES
('ACC1002041', 1, 'Savings', 450000.00),
('ACC1002042', 2, 'Current', 120000.00);

INSERT INTO atm_transactions (account_number, transaction_type, amount) VALUES
('ACC1002041', 'Deposit', 50000.00),
('ACC1002042', 'Withdrawal', 20000.00);

-- 5. Quick Verification Query (See the ledger data)
SELECT 
    t.transaction_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    t.account_number,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM atm_transactions t
JOIN accounts a ON t.account_number = a.account_number
JOIN customers c ON a.customer_id = c.customer_id;
