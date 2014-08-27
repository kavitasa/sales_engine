require_relative 'test_helper'
require_relative '../lib/invoice'
require_relative '../lib/sales_engine'

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    sales_engine = FakeSalesEngine.new
    repository = sales_engine.invoice_repository
    @invoice = Invoice.new(row, repository)
  end

  def row
    {
      id: 1,
      customer_id: 1,
      merchant_id: 26,
      status: "shipped",
      created_at: "2012-03-25 09:54:09 UTC",
      updated_at: "2012-03-25 09:54:09 UTC"
    }
  end

  def test_it_exists
    assert Invoice
  end

  def test_it_assigns_the_attributes
    assert_equal 1, invoice.id
    assert_equal 1, invoice.customer_id
    assert_equal 26, invoice.merchant_id
    assert_equal "shipped", invoice.status
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
    assert invoice.repository
  end

  #Derailed

  def test_transactions_returns_collection_of_Transaction_instances
    assert invoice.transactions[0].is_a?(Transaction)
  end

  def test_invoice_items_returns_collection_of_Invoice_Item_instances
    assert invoice.invoice_items[0].is_a?(InvoiceItem)
  end

  def test_items_returns_collection_of_Items
    assert invoice.items[0].is_a?(Item)
  end

  def test_customer_returns_instance_of_Customer
    assert invoice.customer.is_a?(Customer)
  end

  def test_merchant_returns_instance_of_Merchant
    assert invoice.merchant.is_a?(Merchant)
  end

  # Business Intelligence

  def test_it_can_calculate_total_revenue_per_invoice
    assert_equal BigDecimal.new("2106777"), invoice.total
  end
end
