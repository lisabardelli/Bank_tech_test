# frozen_string_literal: true

class Transaction
  attr_reader :cash_amount, :date
  def initialize(cash_amount, date = Time.new)
    @cash_amount = cash_amount
    @date = date
  end
end
