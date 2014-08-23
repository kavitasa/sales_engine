require_relative './test_helper'
require_relative '../lib/merchant_parser'

class MerchantParserTest < Minitest::Test
  attr_reader :parser, :merchants, :parsed_data

  def setup
    @parser = MerchantParser.new('test/merchant_test_data.csv')
    @parsed_data = parser.parse_data
  end

  def test_it_returns_csv_object
    assert parsed_data.is_a?(CSV)
  end

  def test_it_parses_data_to_return_correct_count
    assert_equal 33, parsed_data.count
  end

  def test_output_for_first_merchant
    first_row = parsed_data.readline
    assert_equal "1", first_row[:id]
    assert_equal "Schroeder-Jerde", first_row[:name]
    assert_equal "2012-03-27 14:53:59 UTC", first_row[:created_at]
    assert_equal "2012-03-27 14:53:59 UTC", first_row[:updated_at]
  end
end
