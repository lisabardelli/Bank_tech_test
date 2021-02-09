# frozen_string_literal: true

require_relative './bank_account.rb'
require_relative './transaction.rb'
require_relative './printer.rb'


bank_account = BankAccount.new
bank_account.deposit(100)
bank_account.withdraw(-50)
bank_account.deposit(50)
bank_account.withdraw(-20)
printer = Printer.new

printer.print_body(bank_account)

