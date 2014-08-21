require_relative './require_helper'
require_relative './item_parser'

class ItemRepository
  attr_reader :items

  def initialize(item_parser = ItemParser.new)
    parsed_csv = item_parser.parse_data
    @items = convert_csv_to_items(parsed_csv)
  end

  def all
    @items
  end

  def random
    @items.sample
  end

  def find_by_id(id)
    items.find { |item| item.id == id }
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

  def find_by_created_at(created_at)
    items.find { |item| item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    items.find { |item| item.updated_at == updated_at }
  end

  def find_all_by_id(id)
    items.find_all { |item| item.id == id }
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

  def find_all_by_created_at(created_at)
    items.find_all { |item| item.created_at == created_at }
  end

  def find_all_by_updated_at(updated_at)
    items.find_all { |item| item.updated_at == updated_at }
  end

  private

  def convert_csv_to_items(parsed_csv)
    parsed_csv.map { |row| Item.new(row) }
  end
end
