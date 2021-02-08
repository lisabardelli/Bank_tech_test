# frozen_string_literal: true

require_relative './bank_account.rb'
require_relative './transaction.rb'


bank_account = BankAccount.new
bank_account.deposit(100)
bank_account.withdraw(-50)
bank_account.print_statement
