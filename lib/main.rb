require_relative './bank_account.rb'
require_relative './transaction.rb'

bank_account = Bank_account.new
bank_account.deposit(100, Time.new.strftime("%d/%m/%Y"))
bank_account.withdrawal(50, Time.new.strftime("%d/%m/%Y"))
bank_account.print_statement
