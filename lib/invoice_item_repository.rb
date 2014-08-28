require_relative './require_helper'
require_relative './invoice_item_parser'


class InvoiceItemRepository
  include Finder
  include HelperMethods

  attr_reader :invoice_items, :sales_engine

  def initialize(sales_engine, data_file)
    parsed_csv      = InvoiceItemParser.new(data_file).parse_data
    @invoice_items  = convert_csv_to_invoice_items(parsed_csv)
    @sales_engine   = sales_engine
  end

  #Listing & Searching

  def all
    @invoice_items
  end

  def find_by_item_id(item_id)
    invoice_items.find { |invoice_item| invoice_item.item_id == item_id }
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.find { |invoice_item| invoice_item.invoice_id == invoice_id}
  end

  def find_by_unit_price(unit_price)
    invoice_items.find { |invoice_item| invoice_item.unit_price == unit_price}
  end

  def find_by_quantity(quantity)
    invoice_items.find { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_all_by_item_id(item_id)
    invoice_items.find_all { |invoice_item| invoice_item.item_id == item_id }
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items.find_all { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_all_by_quantity(quantity)
    invoice_items.find_all { |invoice_item| invoice_item.quantity == quantity }
  end


  #Relationships

  def find_invoice_by_invoice_id(invoice_id)
    sales_engine.find_invoice_by_invoice_id(invoice_id)
  end

  def find_item_by_item_id(item_id)
    sales_engine.find_item_by_item_id(item_id)
  end



  private

  def convert_csv_to_invoice_items(parsed_csv)
    parsed_csv.map { |row| InvoiceItem.new(row, self) }
  end
end
