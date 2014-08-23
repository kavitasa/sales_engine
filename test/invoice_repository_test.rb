require_relative './test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :invoice_repo

  def setup
    test_file_parser = InvoiceParser.new('test/invoice_test_data.csv')
    @invoice_repo = InvoiceRepository.new(sales_engine = nil, test_file_parser)
  end

  def test_it_returns_an_array_of_invoices
    assert invoice_repo.invoices.is_a?(Array)
    assert invoice_repo.invoices.first.is_a?(Invoice)
    assert_equal 33, invoice_repo.invoices.count
  end

  def test_it_returns_all_instances
    assert_equal 33, invoice_repo.all.count
  end

  def test_it_returns_random_instance
    number_of_unique_invoices = (1..33).collect do
      invoice_repo.random.id
    end.uniq.length
    assert number_of_unique_invoices > 10
  end

  def test_it_can_find_by_id
    invoice = invoice_repo.find_by_id("1")
    assert_equal "1", invoice.id
  end

  def test_it_can_find_by_customer_id
    invoice = invoice_repo.find_by_customer_id("1")
    assert_equal "1", invoice.customer_id
  end

  def test_it_can_find_by_merchant_id
    invoice = invoice_repo.find_by_merchant_id("26")
    assert_equal "26", invoice.merchant_id
  end

  def test_it_can_find_by_status
    invoice = invoice_repo.find_by_status("shipped")
    assert_equal "shipped", invoice.status
  end

  def test_it_can_find_by_created_at
    invoice = invoice_repo.find_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_it_can_find_by_updated_at
    invoice = invoice_repo.find_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end

  def test_it_can_find_all_by_id
    invoices = invoice_repo.find_all_by_id("1")
    assert_equal 1, invoices.count
    assert_equal "1", invoices.first.id
  end

  def test_it_can_find_all_by_customer_id
    invoices = invoice_repo.find_all_by_customer_id("1")
    assert_equal 8, invoices.count
    assert_equal "1", invoices[0].id
  end

  def test_it_can_find_all_by_merchant_id
    invoices = invoice_repo.find_all_by_merchant_id("26")
    assert_equal 2, invoices.count
    assert_equal "1", invoices[0].id
  end

  def test_it_can_find_all_by_status
    shipped_invoices = invoice_repo.find_all_by_status("shipped")
    assert_equal 33, shipped_invoices.count
    assert_equal "1", shipped_invoices[0].id
  end

  def test_it_can_find_all_by_created_at
    invoices = invoice_repo.find_all_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, invoices.count
    assert_equal "1", invoices[0].id
  end

  def test_it_can_find_all_by_updated_at
    invoices = invoice_repo.find_all_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, invoices.count
    assert_equal "1", invoices[0].id
  end

end
