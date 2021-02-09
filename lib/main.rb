# frozen_string_literal: true

require_relative './bank_account.rb'
require_relative './transaction.rb'
require_relative './statement.rb'

bank_account = BankAccount.new
bank_account.deposit(100)
bank_account.withdraw(50)
bank_account.deposit(50)
bank_account.withdraw(20)
bank_account.print_statement
