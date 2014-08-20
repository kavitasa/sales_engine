require_relative './test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def setup
    @transaction_repo = TransactionRepository.new("transaction_test_data.csv")
  end

  def test_it_returns_all_instances
    assert_equal 33, @transaction_repo.all.count
  end

  def test_it_returns_random_instance
    skip
  end

  def test_it_can_find_by_transaction_id
    skip
  end

  def test_it_can_find_by_invoice_id
    skip
  end

  def test_it_can_find_by_credit_card_number
    skip
  end

  def test_it_can_find_by_credit_card_expiration_date
    skip
  end

  def test_it_can_find_by_result
    skip
  end

  def test_it_can_find_by_created_at
    skip
  end

  def test_it_can_find_by_updated_at
    skip
  end

  def test_it_can_find_all_by_transaction_id
    skip
  end

  def test_it_can_find_all_by_invoice_id
    skip
  end

  def test_it_can_find_all_by_credit_card_number
    skip
  end

  def test_it_can_find_all_by_credit_card_expiration_date
    skip
  end

  def test_it_can_find_all_by_result
    skip
  end

  def test_it_can_find_all_by_created_at
    skip
  end

  def test_it_can_find_all_by_updated_at
    skip
  end

end
