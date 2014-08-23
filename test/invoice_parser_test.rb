require_relative './test_helper'
require_relative '../lib/invoice_parser'

class InvoiceParserTest < Minitest::Test
  attr_reader :parser, :invoices, :parsed_data

  def setup
    @parser = InvoiceParser.new('test/invoice_test_data.csv')
    @parsed_data = parser.parse_data
  end

  def test_it_returns_csv_object
    assert parsed_data.is_a?(CSV)
  end

  def test_it_parses_data_to_return_correct_count
    assert_equal 33, parsed_data.count
  end

  def test_output_for_first_invoice
    first_row = parsed_data.readline
    assert_equal "1", first_row[:id]
    assert_equal "1", first_row[:customer_id]
    assert_equal "26", first_row[:merchant_id]
    assert_equal "shipped", first_row[:status]
    assert_equal "2012-03-25 09:54:09 UTC", first_row[:created_at]
    assert_equal "2012-03-25 09:54:09 UTC", first_row[:updated_at]
  end
end
