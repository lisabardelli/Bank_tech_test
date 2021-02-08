require_relative './bank_account.rb'



bank_account = Bank_account.new
bank_account.deposit(100, Time.new.strftime("%d/%m/%Y"))
bank_account.withdrawal(50, Time.new.strftime("%d/%m/%Y"))
p 'STATEMENT'
p bank_account.print_statement
