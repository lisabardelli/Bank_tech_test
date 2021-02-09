# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :transactions
  HEADER = 'date || credit || debit || balance'
  def initialize
    @balance = 0
    @transactions = []
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
    temp_balance = 0
    statement = HEADER + "\n"
    transactions.each do |transaction|
      temp_balance += transaction.cash_amount
      if transaction.cash_amount.positive?
        statement += "#{transaction.date}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', temp_balance)}" + "\n"
      else
        statement += "#{transaction.date} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', temp_balance)}" + "\n"
      end
    end
    puts statement
  end

  private

  def create_transaction(cash_amount)
    transaction = Transaction.new(cash_amount)
    @transactions << transaction
    @balance += cash_amount
  end
end
