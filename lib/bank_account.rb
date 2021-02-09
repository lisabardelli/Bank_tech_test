# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :transactions
  HEADER = 'date || credit || debit || balance'
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(cash_amount)
    if cash_amount.negative?
      raise 'Cash to be deposited cannot be a negative amount'
    end
    create_transaction(cash_amount)
  end

  def withdraw(cash_amount)
    if cash_amount.positive?
      raise 'You selected withdraw with a positive amount of cash. Please insert a negative amount'
    end
    raise 'Insufficient funds' if (@balance + cash_amount).negative?
    create_transaction(cash_amount)
  end

  def print_statement
    temp_balance = 0
    statement = HEADER + "\n"
    transactions.each do |transaction|
      temp_balance += transaction.cash_amount
        statement = statement + "#{transaction.date}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', temp_balance)}" + "\n" if transaction.cash_amount.positive?
        statement = statement + "#{transaction.date} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', temp_balance)}" + "\n" if !transaction.cash_amount.positive?
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
