require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/sales_engine'

class ItemTest < Minitest::Test
  attr_reader :item

  def setup
    sales_engine = FakeSalesEngine.new
    repository = sales_engine.item_repository
    @item = Item.new(row, repository)
  end

  def row
    {
      id: 1,
      name: "Item Qui Esse",
      description: "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
      unit_price: "75107",
      merchant_id: 1,
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_exists
    assert Item
  end

  def test_it_assigns_the_attributes
    assert_equal 1, item.id
    assert_equal "Item Qui Esse", item.name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
    assert_equal "751.07", item.unit_price
    assert_equal 1, item.merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
    assert item.repository
  end

  # def test_invoice_items_returns_collection_of_InvoiceItem
  #   assert item.invoice_items[0].is_a?(InvoiceItem)
  # end

  def test_merchant_returns_instance_of_Merchant
    assert item.merchant.is_a?(Merchant)
  end

end
