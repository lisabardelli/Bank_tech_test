require "transaction"

describe "Transaction" do
    it "instantiates the class with 2 arguments" do
    expect(Transaction.new(10)).to be_an_instance_of Transaction
    end 
end