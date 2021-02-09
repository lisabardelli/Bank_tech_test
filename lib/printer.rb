require_relative './printer.rb'
class Printer 

def print_header
    p 'Statement of Account'.center(60)
    p '----------------------------------'.center(60)
    p 'date || credit || debit || balance'.center(60)
end 

def print_body(bank_account)
    temp_balance = 0
    bank_account.transactions.each do |transaction|
      temp_balance += transaction.cash_amount
      if transaction.cash_amount.positive?
        row = "#{transaction.date}|| #{format('%.2f', transaction.cash_amount)} || || #{format('%.2f', temp_balance)}"
      else
        row = "#{transaction.date} || || #{format('%.2f', (-1 * transaction.cash_amount))} || #{format('%.2f', temp_balance)}"
      end
      p row.center(60)
    end
  end

  def print_footer
    p '----------------------------------'.center(60)
    p 'End of statement'.center(60)
  end 
end 