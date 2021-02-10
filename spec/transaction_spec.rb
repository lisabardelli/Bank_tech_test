# frozen_string_literal: true

require 'transaction'

describe 'Transaction' do
  let(:cash_amount) { 10 }
  it 'instantiates the class with 2 arguments' do
    expect(Transaction.new(cash_amount)).to be_an_instance_of Transaction
  end
end
