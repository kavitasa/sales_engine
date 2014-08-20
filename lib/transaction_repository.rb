require_relative './require_helper'
require_relative './transaction_parser'

class TransactionRepository
  attr_reader :transactions

  def initialize
    parsed_csv = TransactionParser.new.parse_data
    @transactions = convert_csv_to_transactions(parsed_csv)
  end

  def all
    @transactions
  end

  def convert_csv_to_transactions(parsed_csv)
    parsed_csv.map { |row| Transaction.new(row) }
  end

  def find_by_transaction_id(id)
    transactions.find { |transaction| transaction.id == id }
  end

  def find_by_invoice_id(invoice_id)
    transactions.find { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_by_credit_card_number(credit_card_number)
    transactions.find { |transaction| transaction.credit_card_number == credit_card_number }
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.find { |transaction| transaction.credit_card_expiration_date == credit_card_expiration_date }
  end

  def find_by_result(result)
    transactions.find { |transaction| transaction.result == result }
  end

  def find_by_created_at(created_at)
    transactions.find { |transaction| transaction.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    transactions.find { |transaction| transaction.updated_at == updated_at }
  end

  def find_all_by_transaction_id(id)
    transactions.find_all { |transaction| transaction.id == id }
  end

end
