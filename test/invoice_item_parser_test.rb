require_relative './test_helper'
require_relative '../lib/invoice_item_parser'

class InvoiceItemParserTest < Minitest::Test
  attr_reader :parser, :invoice_items, :parsed_data

  def setup
    @parser = InvoiceItemParser.new('data/test')
    @parsed_data = parser.parse_data
  end

  def test_it_returns_csv_object
    assert parsed_data.is_a?(CSV)
  end

  def test_it_parses_data_to_return_correct_count
    assert_equal 33, parsed_data.count
  end

  def test_output_for_first_invoice_item
    first_row = parsed_data.readline
    assert_equal "1", first_row[:id]
    assert_equal "20", first_row[:item_id]
    assert_equal "1", first_row[:invoice_id]
    assert_equal "5", first_row[:quantity]
    assert_equal "13635", first_row[:unit_price]
    assert_equal "2012-03-27 14:54:09 UTC", first_row[:created_at]
    assert_equal "2012-03-27 14:54:09 UTC", first_row[:updated_at]
  end
end
