require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/sales_engine'


class TransactionTest < Minitest::Test
  attr_reader :transaction

  def setup
    sales_engine = SalesEngine.new.startup
    repository = sales_engine.transaction_repository
    @transaction = Transaction.new(row, repository)
  end

  def row
    {
      id: "1",
      invoice_id: "1",
      credit_card_number: "4654405418249632",
      credit_card_expiration_date: nil,
      result: "success",
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }
  end

  def test_it_exists
    assert Transaction
  end

  def test_it_assigns_the_attributes
    assert_equal "1", transaction.id
    assert_equal "1", transaction.invoice_id
    assert_equal "4654405418249632", transaction.credit_card_number
    assert_equal nil, transaction.credit_card_expiration_date
    assert_equal "success", transaction.result
    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
    assert transaction.repository
  end

  def test_invoice_returns_instance_of_Invoice
    assert transaction.invoice.is_a?(Invoice)
  end

end
