require_relative './require_helper'
require_relative './invoice_item_parser'

class InvoiceItemRepository
  attr_reader :invoice_items, :sales_engine

  def initialize(sales_engine, invoice_item_parser = InvoiceItemParser.new)
    parsed_csv = invoice_item_parser.parse_data
    @invoice_items = convert_csv_to_invoice_items(parsed_csv)
    @sales_engine = sales_engine
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.find { |invoice_item| invoice_item.id == id }
  end

  def find_by_item_id(item_id)
    invoice_items.find { |invoice_item| invoice_item.item_id == item_id }
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.find { |invoice_item| invoice_item.invoice_id == invoice_id}
  end

  def find_by_quantity(quantity)
    invoice_items.find { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_by_unit_price(unit_price)
    invoice_items.find { |invoice_item| invoice_item.unit_price == unit_price}
  end

  def find_by_created_at(created_at)
    invoice_items.find { |invoice_item| invoice_item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoice_items.find { |invoice_item| invoice_item.updated_at == updated_at }
  end

  def find_all_by_id(id)
    invoice_items.find_all { |invoice_item| invoice_item.id == id }
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

  def find_all_by_unit_price(unit_price)
    invoice_items.find_all { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_all_by_created_at(created_at)
    invoice_items.find_all { |invoice_item| invoice_item.created_at == created_at }
  end

  def find_all_by_updated_at(updated_at)
    invoice_items.find_all { |invoice_item| invoice_item.updated_at == updated_at }
  end

  private

  def convert_csv_to_invoice_items(parsed_csv)
    parsed_csv.map { |row| InvoiceItem.new(row, self) }
  end
end
