require_relative './test_helper'
require_relative '../lib/customer_parser'

class CustomerParserTest < Minitest::Test
  attr_reader :parser, :customers, :parsed_data

  def setup
    @parser = CustomerParser.new('data/test')
    @parsed_data = parser.parse_data
  end

  def test_it_returns_csv_object
    assert parsed_data.is_a?(CSV)
  end

  def test_it_parses_data_to_return_correct_count
    assert_equal 33, parsed_data.count
  end

  def test_output_for_first_customer
    first_row = parsed_data.readline
    assert_equal "1", first_row[:id]
    assert_equal "Joey", first_row[:first_name]
    assert_equal "Ondricka", first_row[:last_name]
    assert_equal "2012-03-27 14:54:09 UTC", first_row[:created_at]
    assert_equal "2012-03-27 14:54:09 UTC", first_row[:updated_at]
  end
end
