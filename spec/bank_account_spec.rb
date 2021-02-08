require 'bank_account'

describe "Bank_account" do

before(:each) do
    @account = Bank_account.new()
end

    it "return an instance of bank" do
        expect(@account).to be_an_instance_of Bank_account
    end

    it "has been initiated with a zero balance" do
        expect(@account.balance).to eq 0
    end


    describe "#deposit" do
        it "adds money to you bank_account with a date" do
            @account.deposit(100, Time.new.strftime("%d/%m/%Y"))
            expect(@account.balance).to eq 100
            expect(@account.date).to eq (Time.new.strftime("%d/%m/%Y"))
        end
    end
    describe "#withdrawal" do
        it "withdraws money on a date" do
            @account.deposit(100, '01/02/2021')
            expect{ @account.withdrawal(200, Time.new.strftime("%d/%m/%Y")) }.to raise_error "Insufficient funds"
            expect(@account.date).to eq ('01/02/2021')
        end
        it "withdraws money on a date" do
            @account.deposit(200, '02/02/2021')
            @account.withdrawal(100, '02/02/2021')
            expect(@account.balance).to eq 100
        end
    end
    describe "#print_statement" do
        it "print a statement of the account with money, date and balance" do
            @account.deposit(200, Time.new.strftime("%d/%m/%Y"))
            @account.withdrawal(100, Time.new.strftime("%d/%m/%Y"))
            expect(@account.statement).to include {date:"08/02/2021", credit:200, debit:"", balance:200}
            expect(@account.statement).to include {date:"08/02/2021", credit:"", debit:100, balance:100}
        end
    end


end