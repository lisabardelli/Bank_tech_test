# frozen_string_literal: true

require_relative './bank_account.rb'
require_relative './transaction.rb'

transaction1 = Transaction.new(100)
transaction2 = Transaction.new(50)
bank_account = BankAccount.new
bank_account.deposit(transaction1.cash_amount, transaction1.date)
bank_account.withdrawal(transaction2.cash_amount, transaction2.date)
bank_account.print_statement
