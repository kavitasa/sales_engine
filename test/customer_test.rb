require_relative 'test_helper'
require_relative '../lib/customer'
require_relative '../lib/sales_engine'

class CustomerTest < Minitest::Test

  def row
    {
      id: "1",
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
    sales_engine = SalesEngine.new
    repository = sales_engine.customer_repository
    customer = Customer.new(row, repository)

    assert_equal "1", customer.id
    assert_equal "Joey", customer.first_name
    assert_equal "Ondricka", customer.last_name
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at

    assert customer.repository
  end

  def test_invoice_returns_collection_of_Invoice_instances
    sales_engine = SalesEngine.new
    repository = sales_engine.customer_repository
    customer = Customer.new(row, repository)
    assert customer.invoices.is_a?(Array)
  end

end
