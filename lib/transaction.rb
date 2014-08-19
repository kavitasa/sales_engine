# require_relative 'require_helper'

class Transaction
  attr_reader :id, :invoice_id, :card_number, :card_expiration_date, :result, :created_at, :updated_at

  def initialize(row)
    @id = row[:id]
    @invoice_id = row[:invoice_id]
    @card_number = row[:credit_card_number]
    @expiration_date = row[:credit_card_expiration_date]
    @result = row[:result]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

end
