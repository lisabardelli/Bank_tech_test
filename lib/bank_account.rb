# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :date, :statement
  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(cash_amount, date)
    unless cash_amount.positive?
      raise 'Cash to be deposited cannot be a negative amount'
    end

    transaction = Transaction.new(cash_amount, date)
    @statement << "#{transaction.date}|| #{transaction.cash_amount.to_f} || || #{(@balance + transaction.cash_amount).to_f}"
    @date = date
    @balance += transaction.cash_amount
  end

  def withdrawal(cash_amount, date)
    transaction = Transaction.new(cash_amount, date)
    raise 'Insufficient funds' if (@balance - transaction.cash_amount).negative?
    @statement << "#{transaction.date} || || #{transaction.cash_amount.to_f} || #{(@balance - transaction.cash_amount).to_f}"
    @balance -= transaction.cash_amount
  end

  
  def print_statement
    p 'Statement of Account'.center(60)
    p '----------------------------------'.center(60)
    p 'date || credit || debit || balance'.center(60)
    @statement.each do |row|
      p row.center(60)
    end
    p '----------------------------------'.center(60)
    p 'End of statement'.center(60)
  end
end
