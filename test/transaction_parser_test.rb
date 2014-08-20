require_relative './test_helper'
require_relative '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test
  attr_reader :parser, :transactions, :parsed_data

  def setup
    @parser = TransactionParser.new('transaction_test_data.csv')
    @parsed_data = parser.parse_data
    # @transactions = parser.change_csv_to_transactions
  end

  def test_it_contains_header_row
    assert parsed_data.header_row?
  end



end
