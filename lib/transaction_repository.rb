require_relative './require_helper'

class TransactionRepository
  attr_reader :transactions

  def initialize
    @transactions = TransactionParser.new.change_csv_to_transactions()
  end

  # def all
  #   transactions
  # end


end
