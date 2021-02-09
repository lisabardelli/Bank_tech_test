# frozen_string_literal: true

require_relative './statement.rb'

class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
    @statement = Statement.new
  end

  def deposit(cash_amount)
    raise 'Cash amount cannot be negative' if cash_amount.negative?

    create_transaction(cash_amount.to_f)
  end

  def withdraw(cash_amount)
    raise 'Cash amount cannot be negative' if cash_amount.negative?
    raise 'Insufficient funds' if (@balance - cash_amount).negative?

    create_transaction((-1 * cash_amount.to_f))
  end

  def print_statement
    @statement.print_statement
  end

  private

  def create_transaction(cash_amount)
    transaction = Transaction.new(cash_amount)
    @transactions << transaction
    @balance += cash_amount
    @statement.append_transaction(transaction, @balance)
  end
end
