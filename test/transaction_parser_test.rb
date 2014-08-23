require_relative './test_helper'
require_relative '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test
  attr_reader :parser, :transactions, :parsed_data

  def setup
    @parser = TransactionParser.new('test/transaction_test_data.csv')
    @parsed_data = parser.parse_data
  end

  def test_it_returns_csv_object
    assert parsed_data.is_a?(CSV)
  end

  def test_it_parses_data_to_return_correct_count
    assert_equal 33, parsed_data.count
  end

  def test_output_for_first_transaction
    first_row = parsed_data.readline
    assert_equal "1", first_row[:id]
    assert_equal "1", first_row[:invoice_id]
    assert_equal "4654405418249632", first_row[:credit_card_number]
    assert_equal nil, first_row[:credit_card_expiration_date]
    assert_equal "success", first_row[:result]
    assert_equal "2012-03-27 14:54:09 UTC", first_row[:created_at]
    assert_equal "2012-03-27 14:54:09 UTC", first_row[:updated_at]
  end
end
