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

  def print_statement()
    p 'date || credit || debit || balance'
    temp_balance = 0
    transactions.each do |transaction|
      temp_balance += transaction.cash_amount
      if transaction.cash_amount.positive?
        row = "#{transaction.date}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', temp_balance)}"
      else
        row = "#{transaction.date} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', temp_balance)}"
      end
      p row
    end
  end 
  private

  def create_transaction(cash_amount)
    transaction = Transaction.new(cash_amount)
    @transactions << transaction
    @balance += cash_amount
  end
end
