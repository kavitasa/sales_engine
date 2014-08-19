require_relative './test_helper'
require_relative '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test

  attr_reader :parser, :transactions

  def setup
    @parser = TransactionParser.new('transaction_test_data.csv')
    @transactions = parser.change_csv_to_transactions
  end

  def test_it_returns_an_array_of_transactions
    assert transactions.is_a?(Array)
    assert transactions.first.is_a?(Transaction)
    assert_equal 33, transactions.count
  end
end
