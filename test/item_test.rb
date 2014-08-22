require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def row
    {
      id: "1",
      name: "Item Qui Esse",
      description: "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
      unit_price: "75107",
      merchant_id: "1",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_exists
    assert Item
  end

  def test_it_assigns_the_attributes
    sales_engine = SalesEngine.new
    repository = sales_engine.item_repository
    item = Item.new(row, repository)
    assert_equal "1", item.id
    assert_equal "Item Qui Esse", item.name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
    assert_equal "75107", item.unit_price
    assert_equal "1", item.merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

end
