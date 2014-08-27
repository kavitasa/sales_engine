require_relative './require_helper'
require_relative './item_parser'
require_relative './helper_methods'

class ItemRepository
  include Finder
  include HelperMethods

  attr_reader :items, :sales_engine

  def initialize(sales_engine, data_file)
    parsed_csv = ItemParser.new(data_file).parse_data
    @items = convert_csv_to_items(parsed_csv)
    @sales_engine = sales_engine
  end

  def all
    @items
  end

  #Listing & Searching

  def find_by_name(name)
    items.find { |item| item.name == name }
  end

  def find_by_description(description)
    items.find { |item| item.description == description }
  end

  def find_by_merchant_id(merchant_id)
    items.find { |item| item.merchant_id == merchant_id}
  end

  def find_by_unit_price(unit_price)
    all.find { |invoice_item| invoice_item.unit_price == unit_price}
  end

  def find_all_by_name(name)
    items.find_all { |item| item.name == name }
  end

  def find_all_by_description(description)
    items.find_all { |item| item.description == description }
  end

  def find_all_by_merchant_id(merchant_id)
    items.find_all { |item| item.merchant_id == merchant_id }
  end

  #Relationships

  def find_merchant_by_merchant_id(merchant_id)
    sales_engine.find_merchant_by_merchant_id(merchant_id)
  end

  def find_all_invoice_items_by_id(id)
    sales_engine.find_all_invoice_items_by_item_id(id)
  end

  private

  def convert_csv_to_items(parsed_csv)
    parsed_csv.map { |row| Item.new(row, self) }
  end
end
