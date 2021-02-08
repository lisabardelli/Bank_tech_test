class Bank_account
    attr_reader :balance, :date, :statement
def initialize
    @balance = 0
    @statement = []
    @transaction = {date: nil, credit: nil, debit: nil, balance: 0 }
end 

def deposit(money, date)
    @statement << "#{@transaction[:date] = date}  || #{@transaction[:credit] = money.to_f}   || || #{@transaction[:balance] = (@balance + money).to_f}" 
    @date = date
    @balance += money


end 

def withdrawal(money, date)
    raise "Insufficient funds" if (@balance - money) < 0 
    @statement << "#{@transaction[:date] = date}  || ||  #{@transaction[:debit] = money.to_f}   || #{@transaction[:balance]= (@balance - money).to_f}" 
    @balance -= money

end 

def print_statement
    p 'Statement of Account'.center(60)
    p "----------------------------------".center(60)
    p 'date || credit || debit || balance'.center(60) 
    @statement.each do |row|
        p row.center(60)
    end 
    p "----------------------------------".center(60)
    p "End of statement".center(60)
end 


end