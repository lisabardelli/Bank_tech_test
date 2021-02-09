# frozen_string_literal: true

class Statement
  attr_reader :statement_to_print

  def initialize(header = 'date || credit || debit || balance')
    @statement_to_print = header + "\n"
  end

  def append_transaction(transaction, new_balance)
    if transaction.cash_amount.positive?
      @statement_to_print += "#{transaction.date}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', new_balance)}" + "\n"
    else
      @statement_to_print += "#{transaction.date} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', new_balance)}" + "\n"
    end
  end

  def print_statement
    puts @statement_to_print
  end
end
