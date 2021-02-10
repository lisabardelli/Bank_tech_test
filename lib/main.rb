# frozen_string_literal: true

require_relative './bank_account.rb'
require_relative './transaction.rb'

bank_account = BankAccount.new
date1 = Time.new(2021, 2, 8)
date2 = Time.new(2021, 2, 10)
bank_account.deposit(100, date1)
bank_account.withdraw(50, date1)
bank_account.deposit(50, date2)
bank_account.withdraw(20, date2)
bank_account.print_statement
