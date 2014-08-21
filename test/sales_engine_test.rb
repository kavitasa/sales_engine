require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_it_has_all_six_repositories
    assert engine.merchant_repository
    assert engine.customer_repository
    assert engine.invoice_repository
    assert engine.invoice_item_repository
    assert engine.item_repository
    assert engine.transaction_repository
  end

end
