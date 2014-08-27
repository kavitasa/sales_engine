require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new('data/test')
    engine.startup
  end

  def test_it_has_all_six_repositories
    assert engine.merchant_repository
    assert engine.customer_repository
    assert engine.invoice_repository
    assert engine.invoice_item_repository
    assert engine.item_repository
    assert engine.transaction_repository
  end

  #Customer

  def test_find_all_invoices_by_customer_id_returns_collection_of_Invoice_instances
    assert engine.find_all_invoices_by_customer_id(1)[0].is_a?(Invoice)
  end

  #InvoiceItem

  def test_find_invoice_by_invoice_id_returns_instance_of_Invoice
    assert engine.find_invoice_by_invoice_id(1).is_a?(Invoice)
  end

  def test_find_item_by_item_id_returns_instance_of_Item
    assert engine.find_item_by_item_id(1).is_a?(Item)
  end

  #Invoice

  def test_find_all_transactions_by_invoice_id_returns_collection_of_Transaction_instances
    assert engine.find_all_transactions_by_invoice_id(1)[0].is_a?(Transaction)
  end


  def test_find_all_invoice_items_by_invoice_id_returns_collection_of_InvoiceItem_instances
    assert engine.find_all_invoice_items_by_invoice_id(1)[0].is_a?(InvoiceItem)
  end

  def test_find_customer_by_customer_id_returns_instance_of_Customer
    assert engine.find_customer_by_customer_id(1).is_a?(Customer)
  end

  #Item

  def test_find_all_invoice_items_by_item_id_returns_collection_of_InvoiceItem_instances
    assert engine.find_all_invoice_items_by_item_id(1)[0].is_a?(InvoiceItem)
  end

  def test_find_merchant_by_merchant_id_returns_instance_of_Merchant
    assert engine.find_merchant_by_merchant_id(1).is_a?(Merchant)
  end

  #Merchant

  def test_find_all_items_by_merchant_id_returns_collection_of_Merchant_instances
    assert engine.find_all_items_by_merchant_id(1)[0].is_a?(Item)
  end


end
