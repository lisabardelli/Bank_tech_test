# frozen_string_literal: true

require 'statement'
describe '#Statement' do
  before(:each) do
    @statement = Statement.new
  end
  it 'instantiates the class' do
    expect(@statement).to be_an_instance_of Statement
  end
  let(:account) { BankAccount.new }
  it 'prints an empty list' do
    transactions = []
    expect { @statement.print_statement(transactions, 0) }.to output('date || credit || debit || balance' + "\n").to_stdout
  end

  it 'prints a list of transactions' do
    mock_now = Time.new(2021, 2, 10)
    transactions = []
    transaction = Transaction.new(100, mock_now)
    transactions.append(transaction)
    expect { @statement.print_statement(transactions, 100) }.to output('date || credit || debit || balance' + "\n" + '10/02/2021|| 100.00 || || 100.00' + "\n").to_stdout
  end
end
