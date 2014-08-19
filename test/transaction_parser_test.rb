require_relative './test_helper'
require_relative '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test

  attr_reader :parser, :transactions

  def setup
    @parser = TransactionParser.new('transaction_test_data.csv')


    @transactions = parser.convert_data_to_transactions(
                [{
                  id: "1",
                  invoice_id: "1",
                  credit_card_number: "4654405418249632",
                  credit_card_expiration_date: nil,
                  result: "success",
                  created_at: "2012-03-27 14:54:09 UTC",
                  updated_at: "2012-03-27 14:54:09 UTC"
                }]
                )
  end

  def test_it_has_all_assigned_attributes
    assert_equal "1", transactions.first.id
    assert_equal "1", transactions.first.invoice_id
    assert_equal "4654405418249632", transactions.first.card_number
    assert_equal nil, transactions.first.card_expiration_date
    assert_equal "success", transactions.first.result
    assert_equal "2012-03-27 14:54:09 UTC", transactions.first.created_at
    assert_equal "2012-03-27 14:54:09 UTC", transactions.first.updated_at
  end

  def test_it_returns_an_array_of_transactions
    assert transactions.is_a?(Array)
    assert transactions.first.is_a?(Transaction)
  end

end
