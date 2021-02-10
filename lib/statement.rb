# frozen_string_literal: true

class Statement
  attr_reader :statement_to_print

  def initialize(header = 'date || credit || debit || balance')
    @statement_to_print = header + "\n"
  end

  def print_statement(transactions, balance)
    for i in 0...transactions.length
      if i == 0
        new_balance = balance
      else
        new_balance -= transactions[(i - 1)].cash_amount
      end
      print_row(transactions[i], new_balance)
    end
    puts @statement_to_print
  end

  private

  def print_row(transaction, new_balance)
    if transaction.cash_amount.positive?
      @statement_to_print += "#{transaction.date.strftime('%d/%m/%Y')}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', new_balance)}" + "\n"
    else
      @statement_to_print += "#{transaction.date.strftime('%d/%m/%Y')} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', new_balance)}" + "\n"
    end
  end
end
