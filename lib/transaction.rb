# frozen_string_literal: true

class Transaction
  attr_reader :date, :cash_amount
  def initialize(cash_amount)
    @cash_amount = cash_amount
    @date = Time.new.strftime('%d/%m/%Y')
  end
end
