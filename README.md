# How to run the program

1. Clone this repo
2. Run IRB on you terminal
3. Require the files ```require './lib/bank_account.rb'``` and ```require './lib/transaction.rb'```
4. Run the commands written in the file ```'./lib/main.rb'```

# How your program works

The program allows the user to manage his/her bank account. It means that the user can deposit/withdrawal cash into/from the bank account and print a statement of the account which includes the following info:

```date || credit || debit || balance```

Error message will be raised if the user tries to withdrawal an amount of money bigger than the actual balance and or deposit a negative amount of cash.

Below an example of the Statement of the user's bank account

![Image of statement](https://i.ibb.co/6YWQS6c/Statement.png)

# How to run the tests
1. Clone this repo
2. Run ```bundle install`` in the terminal
3. Run ```rspec```

# User Stories

```
As a user,
so that I can have cash on my bank account
I would like to deposit cash.

As a user,
so that I can spend my money
I would like to withdraw cash from my bank account.

As a user,
so that I can see when I spent my money
I would like to print a statement of account that includes the date the deposit/withdrawal has been made.

As a user,
so that  know how much left on my bank account
I would like to print a statement of account which includes the balance of the bank account.

```
# Process

The program has been made with a test-driven approach.

I have satisfied all the user stories. Originally I built the program using one class (BankAccount) where all the functionalities were implemented.

Then I extracted the transaction element in a different class to make everything more robust, testable and redable.

## BankAccount Responsabilities

Deposit, Withdraw, Print_statement and Keep Track of the transaction

## Transaction Responsability

Create an Object

# Bank_tech_test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit

Deposit --> (balance - amount) + it cannot be less than 0
Withdrawal --> (balance + amount)
Print Account Statement(date, amount, balance) --> every time I deposit or withdrawal I save the data into a variable
Data can be keep in memory

