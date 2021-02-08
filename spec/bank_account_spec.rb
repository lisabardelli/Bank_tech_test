require 'bank_account'

describe "Bank_account" do

before(:each) do
    @account = Bank_account.new()
end

    it "nstantiates the class " do
        expect(@account).to be_an_instance_of Bank_account
    end

    it "instantiates the class with a zero balance" do
        expect(@account.balance).to eq 0
    end


    describe "#deposit" do
        it "adds cash amount to you bank_account with a date" do
            @account.deposit(100, Time.new.strftime("%d/%m/%Y"))
            expect(@account.balance).to eq 100
            expect(@account.date).to eq (Time.new.strftime("%d/%m/%Y"))
        end
        it "raises an error if the cash amount is a negative number" do
            expect{ @account.deposit(-100, Time.new.strftime("%d/%m/%Y")) }.to raise_error "Cash to be deposited cannot be a negative amount"
        end
    end

    
    describe "#withdrawal" do
        it "raises an error if the cash amount to be taken is more than the balance" do
            @account.deposit(100, Time.new.strftime("%d/%m/%Y"))
            expect{ @account.withdrawal(200, Time.new.strftime("%d/%m/%Y")) }.to raise_error "Insufficient funds"
            expect(@account.date).to eq (Time.new.strftime("%d/%m/%Y"))
        end
        it "withdraws cash amount on a date" do
            @account.deposit(200, Time.new.strftime("%d/%m/%Y"))
            @account.withdrawal(100, Time.new.strftime("%d/%m/%Y"))
            expect(@account.balance).to eq 100
        end
    end
    describe "#print_statement" do
        it "printsa statement of the account with cash amount, date and balance" do
            @account.deposit(200, Time.new.strftime("%d/%m/%Y"))
            @account.withdrawal(100, Time.new.strftime("%d/%m/%Y"))
            expect(@account.statement).to include {date:Time.new.strftime("%d/%m/%Y"), credit:200, debit:"", balance:200}
            expect(@account.statement).to include {date:Time.new.strftime("%d/%m/%Y"), credit:"", debit:100, balance:100}
        end
        it "prints an header" do
            expect(@account.print_statement).to include {'Statement of Account'}
        end
    end


end