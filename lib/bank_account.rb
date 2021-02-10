# frozen_string_literal: true

require_relative './statement.rb'

class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
    @statement = Statement.new
  end

  def deposit(cash_amount, date = Time.new)
    check_amount(cash_amount)

    create_transaction(cash_amount.to_f, date)
  end

  def withdraw(cash_amount, date = Time.new)
    check_amount(cash_amount)
    raise 'Insufficient funds' if (@balance - cash_amount).negative?

    create_transaction((-1 * cash_amount.to_f), date)
  end

  def print_statement
    @statement.print_statement(@transactions, @balance)
  end

  private

  def check_amount(cash_amount)
    raise 'Cash amount cannot be negative' if cash_amount.negative?
  end

  def create_transaction(cash_amount, date)
    transaction = Transaction.new(cash_amount, date)
    @transactions.insert(0, transaction)
    @balance += cash_amount
  end
end
