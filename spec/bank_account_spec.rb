# frozen_string_literal: true

require 'Bank_account'

describe 'BankAccount' do
  before(:each) do
    @account = BankAccount.new
  end

  describe '#initialize' do
    it 'instantiates the class ' do
      expect(@account).to be_an_instance_of BankAccount
    end
    it 'instantiates the class with a zero balance' do
      expect(@account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'adds cash amount to you BankAccount with a date' do
      @account.deposit(100)
      expect(@account.balance).to eq 100
    end
    it 'raises an error if the cash amount is a negative number' do
      expect { @account.deposit(-100) }.to raise_error 'Cash to be deposited cannot be a negative amount'
    end
  end

  describe '#withdraw' do
    it 'raises an error if the cash amount to be taken is more than the balance' do
      @account.deposit(100)
      expect { @account.withdraw(-200) }.to raise_error 'Insufficient funds'
    end
    it 'withdraws cash amount on a date' do
      @account.deposit(200)
      @account.withdraw(-100)
      expect(@account.balance).to eq 100
    end
    it 'raises an error if withdrawal has a positive cash amount' do
        expect { @account.withdraw(100) }.to raise_error 'You selected withdraw with a positive amount of cash. Please insert a negative amount'
      end
  end

  describe '#print_statement' do
    it 'prints a statement of the account when a deposit is done' do
      @account.deposit(200)
     expect{@account.print_statement}.to output("date || credit || debit || balance"+ "\n" + "09/02/2021|| 200.00 || || 200.00"+ "\n").to_stdout
    end
    it 'prints a statement of the account when  deposit + withdrawail are done' do
      @account.deposit(200)
      @account.withdraw(-100)
     expect{@account.print_statement}.to output("date || credit || debit || balance"+ "\n" + "09/02/2021|| 200.00 || || 200.00"+ "\n" + "09/02/2021 || || 100.00 || 100.00" + "\n").to_stdout
    end
   
  end
end
