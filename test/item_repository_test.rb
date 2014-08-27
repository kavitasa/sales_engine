require_relative './test_helper'
require_relative '../lib/item_repository'
require_relative '../lib/sales_engine'

class ItemRepositoryTest < Minitest::Test
  attr_reader :item_repo

  def setup
    @item_repo = ItemRepository.new(FakeSalesEngine.new, 'data/test')
  end

  #Listing & Searching

  def test_it_returns_an_array_of_items
    assert item_repo.items.is_a?(Array)
    assert item_repo.items.first.is_a?(Item)
    assert_equal 33, item_repo.items.count
  end

  def test_it_returns_all_instances
    assert_equal 33, item_repo.all.count
  end

  def test_it_returns_random_instance
    number_of_unique_items = (1..33).collect do
      item_repo.random.id
    end.uniq.length
    assert number_of_unique_items > 10
  end

  def test_it_can_find_by_id
    item = item_repo.find_by_id(1)
    assert_equal 1, item.id
  end

  def test_it_can_find_by_name
    item = item_repo.find_by_name("Item Expedita Fuga")
    assert_equal "Item Expedita Fuga", item.name
  end

  def test_it_can_find_by_description
    item = item_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
  end

  def test_it_can_find_by_unit_price
    item = item_repo.find_by_unit_price(BigDecimal.new("751.07"))
    assert_equal BigDecimal.new("751.07"), item.unit_price
  end

  def test_it_can_find_by_merchant_id
    item = item_repo.find_by_merchant_id(1)
    assert_equal 1, item.merchant_id
  end

  def test_it_can_find_by_created_at
    item = item_repo.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_it_can_find_by_updated_at
    item = item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_it_can_find_all_by_id
    items = item_repo.find_all_by_id(1)
    assert_equal 1, items.count
    assert_equal 1, items.first.id
  end

  def test_it_can_find_all_by_name
    items = item_repo.find_all_by_name("Item Expedita Fuga")
    assert_equal 2, items.count
    assert_equal 3, items[0].id
    assert_equal 7, items[1].id
  end

  def test_it_can_find_all_by_description
    items = item_repo.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal 1, items.count
    assert_equal 1, items[0].id
  end

  def test_it_can_find_all_by_unit_price
    items = item_repo.find_all_by_unit_price(BigDecimal.new("751.07"))
    assert_equal 1, items.count
    assert_equal 1, items[0].id
  end

  def test_it_can_find_all_by_merchant_id
    items = item_repo.find_all_by_merchant_id(1)
    assert_equal 15, items.count
    assert_equal 1, items[0].id
  end

  def test_it_can_find_all_by_created_at
    items = item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 33, items.count
    assert_equal 1, items[0].id
  end

  def test_it_can_find_all_by_updated_at
    items = item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 33, items.count
    assert_equal 1, items[0].id
  end

  #Relationships

  def test_it_can_find_merchant_by_merchant_id
    merchant = item_repo.find_merchant_by_merchant_id(1)
    assert_equal 1, merchant.id
  end

  def test_it_can_find_all_invoice_items_by_id
    invoice_items = item_repo.find_all_invoice_items_by_id(1)
    assert_equal 1, invoice_items[0].id
  end

end
