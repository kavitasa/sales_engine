require_relative './test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :transaction_repo

  def setup
    @transaction_repo = TransactionRepository.new(FakeSalesEngine.new, 'data/test')
  end

  def test_it_returns_an_array_of_transactions
    assert transaction_repo.transactions.is_a?(Array)
    assert transaction_repo.transactions.first.is_a?(Transaction)
    assert_equal 33, transaction_repo.transactions.count
  end

  def test_it_returns_all_instances
    assert_equal 33, transaction_repo.all.count
  end

  def test_it_returns_random_instance
    number_of_unique_transactions = (1..33).collect do
      transaction_repo.random.id
    end.uniq.length
    assert number_of_unique_transactions > 10
  end

  def test_it_can_find_by_id
    transaction = transaction_repo.find_by_id("1")
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

  def test_it_can_find_all_by_id
    transactions = transaction_repo.find_all_by_id("1")
    assert_equal 1, transactions.count
    assert_equal "1", transactions.first.id
  end

  def test_it_can_find_all_by_invoice_id
    transactions = transaction_repo.find_all_by_invoice_id("12")
    assert_equal 3, transactions.count
    assert_equal "11", transactions[0].id
    assert_equal "12", transactions[1].id
    assert_equal "13", transactions[2].id
  end

  def test_it_can_find_all_by_credit_card_number
    transactions = transaction_repo.find_all_by_credit_card_number("4993984512460266")
    assert_equal 2, transactions.count
    assert_equal "32", transactions[0].id
    assert_equal "33", transactions[1].id
  end

  def test_it_can_find_all_by_credit_card_expiration_date
    transactions = transaction_repo.find_all_by_credit_card_expiration_date(nil)
    assert_equal 33, transactions.count
    assert_equal "1", transactions[0].id
  end

  def test_it_can_find_all_by_result
    failed_transactions = transaction_repo.find_all_by_result("failed")
    assert_equal 5, failed_transactions.count
    assert_equal "11", failed_transactions[0].id
  end

  def test_it_can_find_all_by_created_at
    transactions = transaction_repo.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 20, transactions.count
    assert_equal "3", transactions[0].id
  end

  def test_it_can_find_all_by_updated_at
    transactions = transaction_repo.find_all_by_updated_at("2012-03-27 14:54:11 UTC")
    assert_equal 11, transactions.count
    assert_equal "23", transactions[0].id
  end

  #Relationships

  def test_it_can_find_invoice_by_invoice_id
    invoice = transaction_repo.find_invoice_by_invoice_id("1")
    assert_equal "1", invoice.id
  end

end
