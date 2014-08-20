require_relative './test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :transaction_repo

  def setup
    @transaction_repo = TransactionRepository.new
  end

  def test_it_returns_an_array_of_transactions
    assert transaction_repo.transactions.is_a?(Array)
    assert transaction_repo.transactions.first.is_a?(Transaction)
    assert_equal 5595, transaction_repo.transactions.count
  end

  def test_it_returns_all_instances
    assert_equal 5595, transaction_repo.all.count
  end

  def test_it_returns_random_instance
    transaction_id1 = transaction_repo.transactions.sample.id
    transaction_id2 = transaction_repo.transactions.sample.id
    refute_equal transaction_id1, transaction_id2
  end

  def test_it_can_find_by_transaction_id
    transaction = transaction_repo.find_by_transaction_id("1")
    assert_equal "1", transaction.id
  end

  def test_it_can_find_by_invoice_id
    transaction = transaction_repo.find_by_invoice_id("2")
    assert_equal "2", transaction.invoice_id
  end

  def test_it_can_find_by_credit_card_number
    transaction = transaction_repo.find_by_credit_card_number("4354495077693036")
    assert_equal "4354495077693036", transaction.credit_card_number
  end

  def test_it_can_find_by_credit_card_expiration_date
    transaction = transaction_repo.find_by_credit_card_expiration_date(nil)
    assert_equal nil, transaction.credit_card_expiration_date
  end

  def test_it_can_find_by_result
    transaction = transaction_repo.find_by_result("success")
    assert_equal "success", transaction.result
  end

  def test_it_can_find_by_created_at
    transaction = transaction_repo.find_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal "2012-03-27 14:54:10 UTC", transaction.created_at
  end

  def test_it_can_find_by_updated_at
    transaction = transaction_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end

  # def test_it_can_find_all_by_transaction_id
  #   transactions = transaction_repo.find_all_by_transaction_id("1")
  #   assert_equal "1", transactions.first.id
  # end

  # def test_it_can_find_all_by_invoice_id
  #   transactions = transaction_repo.find_all_by_invoice_id("2")
  #   # assert_equal "2", transaction.invoice_id
  # end

  # def test_it_can_find_all_by_credit_card_number
  #   transactions = transaction_repo.find_all_by_credit_card_number("4354495077693036")
  # end

  def test_it_can_find_all_by_credit_card_expiration_date
    skip
  end

  def test_it_can_find_all_failed_by_result
    failed_transactions = transaction_repo.find_all_by_result("failed")
    successful_transactions = transaction_repo.find_all_by_result("success")
    p failed_transactions.count
    p successful_transactions.count
    p failed_transactions.count + successful_transactions.count
  end

  def test_it_can_find_all_by_created_at
    skip
  end

  def test_it_can_find_all_by_updated_at
    skip
  end

end
