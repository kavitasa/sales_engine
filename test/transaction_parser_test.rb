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
                  card_number: "4654405418249632",
                  card_expiration_date: nil,
                  result: "success",
                  created_at: "2012-03-27 14:54:09 UTC",
                  updated_at: "2012-03-27 14:54:09 UTC"
                }]
                )
  end

  def test_it_has_all_assigned_attributes
    assert_equal "1", transactions.first.id
    assert_equal "1", transactions.first.invoice_id
  end

  def test_it_returns_an_array_of_transactions
    assert transactions.is_a?(Array)
    assert transactions.first.is_a?(Transaction)
  end



  def test_it_cleans_valid_transaction_id
    skip

  end

  def test_it_cleans_nil_transaction_id

  end

end
