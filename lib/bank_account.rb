# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :transactions
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
    p 'Statement of Account'.center(60)
    p '----------------------------------'.center(60)
    p 'date || credit || debit || balance'.center(60)
    temp_balance = 0
    @transactions.each do |transaction|
      temp_balance += transaction.cash_amount
      if transaction.cash_amount.positive?
        row = "#{transaction.date}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', temp_balance)}"
      else

        row = "#{transaction.date} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', temp_balance)}"
      end
      p row.center(60)
    end
    p '----------------------------------'.center(60)
    p 'End of statement'.center(60)
  end

  private

  def create_transaction(cash_amount)
    transaction = Transaction.new(cash_amount)
    @transactions << transaction
    @balance += cash_amount
  end
end
