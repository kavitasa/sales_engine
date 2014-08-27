require_relative './test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :customer_repo

  def setup
    test_file_parser = CustomerParser.new('data/test')
    @customer_repo = CustomerRepository.new(FakeSalesEngine.new, test_file_parser)
  end

  def test_it_returns_an_array_of_customers
    assert customer_repo.customers.is_a?(Array)
    assert customer_repo.customers.first.is_a?(Customer)
    assert_equal 33, customer_repo.customers.count
  end

  def test_it_returns_all_instances
    assert_equal 33, customer_repo.all.count
  end

  def test_it_returns_random_instance
    number_of_unique_customers = (1..33).collect do
      customer_repo.random.id
    end.uniq.length
    assert number_of_unique_customers > 10
  end

  def test_it_can_find_by_id
    customer = customer_repo.find_by_id("1")
    assert_equal "1", customer.id
  end

  def test_it_can_find_by_first_name
    customer = customer_repo.find_by_first_name("Joey")
    assert_equal "Joey", customer.first_name
  end

  def test_it_can_find_by_last_name
    customer = customer_repo.find_by_last_name("Ondricka")
    assert_equal "Ondricka", customer.last_name
  end

  def test_it_can_find_by_created_at
    customer = customer_repo.find_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal "2012-03-27 14:54:10 UTC", customer.created_at
  end

  def test_it_can_find_by_updated_at
    customer = customer_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

  def test_it_can_find_all_by_id
    customers = customer_repo.find_all_by_id("1")
    assert_equal 1, customers.count
    assert_equal "1", customers.first.id
  end

  def test_it_can_find_all_by_first_name
    customers = customer_repo.find_all_by_first_name("Joey")
    assert_equal 2, customers.count
    assert_equal "1", customers[0].id
  end

  def test_it_can_find_all_by_last_name
    customers = customer_repo.find_all_by_last_name("Ondricka")
    assert_equal 2, customers.count
    assert_equal "1", customers[0].id
  end

  def test_it_can_find_all_by_created_at
    customers = customer_repo.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 6, customers.count
    assert_equal "2", customers[0].id
  end

  def test_it_can_find_all_by_updated_at
    customers = customer_repo.find_all_by_updated_at("2012-03-27 14:54:11 UTC")
    assert_equal 3, customers.count
    assert_equal "8", customers[0].id
  end

  #Relationships

  def test_it_can_find_all_invoices_by_id
    invoices = customer_repo.find_all_invoices_by_id("1")
    assert_equal 8, invoices.count
    assert_equal "1", invoices[0].id
  end

end
