require_relative 'test_helper'
require_relative '../lib/invoice_item'
require_relative '../lib/sales_engine'

class InvoiceItemTest < Minitest::Test
  attr_reader :invoice_item

  def setup
    sales_engine = FakeSalesEngine.new
    repository = sales_engine.invoice_item_repository
    @invoice_item = InvoiceItem.new(row, repository)
  end

  def row
    {
      id: 1,
      item_id: 20,
      invoice_id: 1,
      quantity: 5,
      unit_price: "13635",
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }
  end

  def test_it_exists
    assert InvoiceItem
  end

  def test_it_assigns_the_attributes
    assert_equal 1, invoice_item.id
    assert_equal 20, invoice_item.item_id
    assert_equal 1, invoice_item.invoice_id
    assert_equal 5, invoice_item.quantity
    assert_equal BigDecimal.new("13635"), invoice_item.unit_price
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end

  def test_invoice_returns_instance_of_Invoice
    assert invoice_item.invoice.is_a?(Invoice)
  end

  def test_item_returns_instance_of_Item
    assert invoice_item.item.is_a?(Item)
  end

  # Business Intelligence

  def test_it_returns_total_price
    assert_equal BigDecimal.new("13635") * 5, invoice_item.total_price
  end

  def test_it_returns_total_items
    assert_equal 5, invoice_item.total_items
  end
end
