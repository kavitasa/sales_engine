require_relative './require_helper'
require_relative './transaction_parser'

class TransactionRepository

  def initialize(filename = 'transactions.csv')
    @transactions = TransactionParser.new(filename).change_csv_to_transactions()
  end

  def all
    @transactions
  end

  def sample
    all.sample
  end

end
