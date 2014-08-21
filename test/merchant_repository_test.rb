require_relative './test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merchant_repo

  def setup
    test_file_parser = MerchantParser.new('merchant_test_data.csv')
    @merchant_repo = MerchantRepository.new(test_file_parser)
  end

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
    merchant = merchant_repo.find_by_id("1")
    assert_equal "1", merchant.id
  end

  def test_it_can_find_by_name
    merchant = merchant_repo.find_by_name("Schroeder-Jerde")
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_it_can_find_by_created_at
    merchant = merchant_repo.find_by_created_at("2012-03-27 14:54:01 UTC")
    assert_equal "2012-03-27 14:54:01 UTC", merchant.created_at
  end

  def test_it_can_find_by_updated_at
    merchant = merchant_repo.find_by_updated_at("2012-03-27 14:54:00 UTC")
    assert_equal "2012-03-27 14:54:00 UTC", merchant.updated_at
  end

  def test_it_can_find_all_by_id
    merchants = merchant_repo.find_all_by_id("1")
    assert_equal 1, merchants.count
    assert_equal "1", merchants.first.id
  end

  def test_it_can_find_all_by_name
    merchants = merchant_repo.find_all_by_name("Schroeder-Jerde")
    assert_equal 1, merchants.count
    assert_equal "1", merchants[0].id
  end

  def test_it_can_find_all_by_created_at
    merchants = merchant_repo.find_all_by_created_at("2012-03-27 14:54:00 UTC")
    assert_equal 12, merchants.count
    assert_equal "10", merchants[0].id
  end

  def test_it_can_find_all_by_updated_at
    merchants = merchant_repo.find_all_by_updated_at("2012-03-27 14:54:00 UTC")
    assert_equal 12, merchants.count
    assert_equal "10", merchants[0].id
  end

end
