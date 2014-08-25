require_relative './require_helper'
require_relative './item_parser'
require_relative './randomizer'

class ItemRepository
  include Finder
  include Randomizer

  attr_reader :items, :sales_engine

  def initialize(sales_engine, item_parser = ItemParser.new)
    parsed_csv = item_parser.parse_data
    @items = convert_csv_to_items(parsed_csv)
    @sales_engine = sales_engine
  end

  def all
    @items
  end

  def find_by_name(name)
    items.find { |item| item.name == name }
  end

  def find_by_description(description)
    items.find { |item| item.description == description }
  end

  def find_by_unit_price(unit_price)
    items.find { |item| item.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    items.find { |item| item.merchant_id == merchant_id}
  end

  def find_all_by_name(name)
    items.find_all { |item| item.name == name }
  end

  def find_all_by_description(description)
    items.find_all { |item| item.description == description }
  end

  def find_all_by_unit_price(unit_price)
    items.find_all { |item| item.unit_price == unit_price }
  end

  def find_all_by_merchant_id(merchant_id)
    items.find_all { |item| item.merchant_id == merchant_id }
  end


  private

  def convert_csv_to_items(parsed_csv)
    parsed_csv.map { |row| Item.new(row, self) }
  end
end
