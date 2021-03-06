require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  attr_reader :merchant

  def setup
    sales_engine = FakeSalesEngine.new
    repository = sales_engine.merchant_repository
    @merchant = Merchant.new(row, repository)
  end

  def row
    {
      id: 1,
      name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_exists
    assert Merchant
  end

  def test_it_assigns_the_attributes
    assert_equal 1, merchant.id
    assert_equal "Schroeder-Jerde", merchant.name
    assert_equal Date.parse("2012-03-27"), merchant.created_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
    assert merchant.repository
  end

  def test_items_returns_collection_of_Item_instances
    assert merchant.items[0].is_a?(Item)
  end

  def test_invoices_returns_collection_of_Invoice_instances
    assert merchant.invoices[0].is_a?(Invoice)
  end

  # Business Intelligence

  def test_it_can_calculate_total_revenue
    assert_equal BigDecimal.new("2496.57"), merchant.revenue
  end

  def test_it_can_calculate_total_items
    assert_equal 13, merchant.total_items
  end

  def test_it_can_calculate_revenue_on_a_date_per_merchant
    assert_equal BigDecimal.new("1405.77"), merchant.revenue(Date.parse("2012-03-25"))
  end
end
