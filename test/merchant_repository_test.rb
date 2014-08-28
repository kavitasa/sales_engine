require_relative './test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merchant_repo

  def setup
    @merchant_repo = MerchantRepository.new(FakeSalesEngine.new, data_file = 'data/test')
  end

  #Listing & Searching

  def test_it_returns_an_array_of_merchant
    assert merchant_repo.merchants.is_a?(Array)
    assert merchant_repo.merchants.first.is_a?(Merchant)
    assert_equal 33, merchant_repo.merchants.count
  end

  def test_it_returns_all_instances
    assert_equal 33, merchant_repo.all.count
  end

  def test_it_returns_random_instance
    number_of_unique_merchants = (1..33).collect do
      merchant_repo.random.id
    end.uniq.length
    assert number_of_unique_merchants > 10
  end

  def test_it_can_find_by_id
    merchant = merchant_repo.find_by_id(1)
    assert_equal 1, merchant.id
  end

  def test_it_can_find_by_name
    merchant = merchant_repo.find_by_name("Schroeder-Jerde")
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_it_can_find_by_created_at
    merchant = merchant_repo.find_by_created_at(Date.parse("2012-03-27"))
    assert_equal Date.parse("2012-03-27"), merchant.created_at
  end

  def test_it_can_find_by_updated_at
    merchant = merchant_repo.find_by_updated_at("2012-03-27 14:54:00 UTC")
    assert_equal "2012-03-27 14:54:00 UTC", merchant.updated_at
  end

  def test_it_can_find_all_by_id
    merchants = merchant_repo.find_all_by_id(1)
    assert_equal 1, merchants.count
    assert_equal 1, merchants.first.id
  end

  def test_it_can_find_all_by_name
    merchants = merchant_repo.find_all_by_name("Schroeder-Jerde")
    assert_equal 1, merchants.count
    assert_equal 1, merchants[0].id
  end

  def test_it_can_find_all_by_created_at
    merchants = merchant_repo.find_all_by_created_at(Date.parse("2012-03-27"))
    assert_equal 33, merchants.count
    assert_equal 1, merchants[0].id
  end

  def test_it_can_find_all_by_updated_at
    merchants = merchant_repo.find_all_by_updated_at("2012-03-27 14:54:00 UTC")
    assert_equal 12, merchants.count
    assert_equal 10, merchants[0].id
  end

  #Relationships

  def test_it_can_find_all_items_by_id
    items = merchant_repo.find_all_items_by_id(1)
    assert_equal 15, items.count
    assert_equal 1, items[0].id
  end

  def test_it_can_find_all_invoices_by_id
    invoices = merchant_repo.find_all_invoices_by_id(1)
    assert_equal 2, invoices.count
    assert_equal 12, invoices[0].id
  end

  #Business Intelligence

  def test_it_can_return_top_x_merchant_instances_ranked_by_total_revenue
    merchants = merchant_repo.most_revenue(10)
    assert_equal 10, merchants.count
    assert merchants[0].revenue >= merchants[1].revenue
  end

  def test_it_can_return_top_x_merchant_instances_ranked_by_total_items
    merchants = merchant_repo.most_items(10)
    assert_equal 10, merchants.count
    assert merchants[0].total_items >= merchants[1].total_items
  end

  def test_it_can_return_total_revenue_for_a_date_for_all_merchants
    revenue = merchant_repo.revenue(Date.parse("2012-03-25"))
    assert_equal BigDecimal.new("22473.54"), revenue
  end



end
