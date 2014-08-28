require_relative './test_helper'
require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :invoice_item_repo

  def setup
    @invoice_item_repo = InvoiceItemRepository.new(FakeSalesEngine.new, 'data/test')
  end

  #Listing & Searching

  def test_it_returns_an_array_of_invoice_items
    assert invoice_item_repo.invoice_items.is_a?(Array)
    assert invoice_item_repo.invoice_items.first.is_a?(InvoiceItem)
    assert_equal 33, invoice_item_repo.invoice_items.count
  end

  def test_it_returns_all_instances
    assert_equal 33, invoice_item_repo.all.count
  end

  def test_it_returns_random_instance
    number_of_unique_invoice_items = (1..33).collect do
      invoice_item_repo.random.id
    end.uniq.length
    assert number_of_unique_invoice_items > 10
  end

  def test_it_can_find_by_id
    invoice_item = invoice_item_repo.find_by_id(1)
    assert_equal 1, invoice_item.id
  end

  def test_it_can_find_by_item_id
    invoice_item = invoice_item_repo.find_by_item_id(20)
    assert_equal 20, invoice_item.item_id
  end

  def test_it_can_find_by_invoice_id
    invoice_item = invoice_item_repo.find_by_invoice_id(1)
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_can_find_by_quantity
    invoice_item = invoice_item_repo.find_by_quantity(5)
    assert_equal 5, invoice_item.quantity
  end

  def test_it_can_find_by_unit_price
    invoice_item = invoice_item_repo.find_by_unit_price(BigDecimal.new("136.35"))
    assert_equal BigDecimal.new("136.35"), invoice_item.unit_price
  end

  def test_it_can_find_by_created_at
    invoice_item = invoice_item_repo.find_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal "2012-03-27 14:54:10 UTC", invoice_item.created_at
  end

  def test_it_can_find_by_updated_at
    invoice_item = invoice_item_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end

  def test_it_can_find_all_by_id
    invoice_items = invoice_item_repo.find_all_by_id(1)
    assert_equal 1, invoice_items.count
    assert_equal 1, invoice_items.first.id
  end

  def test_it_can_find_all_by_item_id
    invoice_items = invoice_item_repo.find_all_by_item_id(20)
    assert_equal 1, invoice_items.count
    assert_equal 2, invoice_items[0].id
  end

  def test_it_can_find_all_by_invoice_id
    invoice_items = invoice_item_repo.find_all_by_invoice_id(1)
    assert_equal 8, invoice_items.count
    assert_equal 1, invoice_items[0].id
  end

  def test_it_can_find_all_by_quantity
    invoice_items = invoice_item_repo.find_all_by_quantity(5)
    assert_equal 5, invoice_items.count
    assert_equal 1, invoice_items[0].id
  end

  def test_it_can_find_all_by_unit_price
    invoice_items = invoice_item_repo.find_all_by_unit_price(BigDecimal.new("136.35"))
    assert_equal 2, invoice_items.count
    assert_equal 1, invoice_items[0].id
  end

  def test_it_can_find_all_by_created_at
    invoice_items = invoice_item_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 15, invoice_items.count
    assert_equal 1, invoice_items[0].id
  end

  def test_it_can_find_all_by_updated_at
    invoice_items = invoice_item_repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 16, invoice_items.count
    assert_equal 16, invoice_items[0].id
  end

  #Relationships

  def test_it_can_find_invoice_by_invoice_id
    invoice = invoice_item_repo.find_invoice_by_invoice_id(1)
    assert_equal 1, invoice.id
  end

  def test_it_can_find_item_by_item_id
    item = invoice_item_repo.find_item_by_item_id(1)
    assert_equal 1, item.id
  end

  #Business Intelligence

  def test_it_can_calculate_total_price_per_invoice_item

  end

end
