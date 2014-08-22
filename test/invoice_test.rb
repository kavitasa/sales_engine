require_relative 'test_helper'
require_relative '../lib/invoice'
require_relative '../lib/sales_engine'

class InvoiceTest < Minitest::Test

  def row
    {
      id: "1",
      customer_id: "1",
      merchant_id: "26",
      status: "shipped",
      created_at: "2012-03-25 09:54:09 UTC",
      updated_at: "2012-03-25 09:54:09 UTC"
    }
  end

  def test_it_exists
    assert Invoice
  end

  def test_it_assigns_the_attributes
    sales_engine = SalesEngine.new
    repository = sales_engine.invoice_repository
    invoice = Invoice.new(row, repository)

    assert_equal "1", invoice.id
    assert_equal "1", invoice.customer_id
    assert_equal "26", invoice.merchant_id
    assert_equal "shipped", invoice.status
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at

    assert invoice.repository
  end

  def test_transactions_returns_collection_of_Transaction_instances
    sales_engine = SalesEngine.new
    repository = sales_engine.invoice_repository
    invoice = Invoice.new(row, repository)
    assert invoice.transaction[0].is_a?(Transaction)
  end

  def test_invoice_items_returns_collection_of_Invoice_Item_instances
    sales_engine = SalesEngine.new
    repository = sales_engine.invoice_repository
    invoice = Invoice.new(row, repository)
    assert invoice.invoice_item[0].is_a?(InvoiceItem)
  end



end
