require_relative './test_helper'
require_relative '../lib/item_parser'

class ItemParserTest < Minitest::Test
  attr_reader :parser, :items, :parsed_data

  def setup
    @parser = ItemParser.new('data/test')
    @parsed_data = parser.parse_data
  end

  def test_it_returns_csv_object
    assert parsed_data.is_a?(CSV)
  end

  def test_it_parses_data_to_return_correct_count
    assert_equal 33, parsed_data.count
  end

  def test_output_for_first_item
    first_row = parsed_data.readline
    assert_equal "1", first_row[:id]
    assert_equal "Item Qui Esse", first_row[:name]
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", first_row[:description]
    assert_equal "75107", first_row[:unit_price]
    assert_equal "1", first_row[:merchant_id]
    assert_equal "2012-03-27 14:53:59 UTC", first_row[:created_at]
    assert_equal "2012-03-27 14:53:59 UTC", first_row[:updated_at]
  end
end
