require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  attr_reader :customer

  def setup
    sales_engine = FakeSalesEngine.new
    repository = sales_engine.customer_repository
    @customer = Customer.new(row, repository)
  end

  def row
    {
      id: 1,
      first_name: "Joey",
      last_name: "Ondricka",
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }
  end

  def test_it_exists
    assert Customer
  end

  def test_it_assigns_the_attributes
    assert_equal 1, customer.id
    assert_equal "Joey", customer.first_name
    assert_equal "Ondricka", customer.last_name
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at

    assert customer.repository
  end

  def test_invoices_returns_collection_of_Invoice_instances
    assert customer.invoices[0].is_a?(Invoice)
  end

end
