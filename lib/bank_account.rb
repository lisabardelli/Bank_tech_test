# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(cash_amount)
    raise 'Cash to be deposited cannot be a negative amount' if cash_amount.negative?
    create_transaction(cash_amount)
  end

  def withdraw(cash_amount)
    raise 'You selected withdraw with a positive amount of cash. Please insert a negative amount' if cash_amount.positive?
    raise 'Insufficient funds' if (@balance + cash_amount).negative?
    create_transaction(cash_amount)
  end

  private

  def create_transaction(cash_amount)
    transaction = Transaction.new(cash_amount)
    @transactions << transaction
    @balance += cash_amount
  end
end
