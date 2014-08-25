require_relative './require_helper'
require_relative './transaction_parser'
require_relative './finder'
require_relative './randomizer'

class TransactionRepository
  include Finder
  include Randomizer

  attr_reader :transactions, :sales_engine

  def initialize(sales_engine, transaction_parser = TransactionParser.new)
    parsed_csv = transaction_parser.parse_data
    @transactions = convert_csv_to_transactions(parsed_csv)
    @sales_engine = sales_engine
  end

  def all
    @transactions
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
    transactions.find { |transaction| transaction.result == result}
  end

  def find_all_by_invoice_id(invoice_id)
    transactions.find_all { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_all_by_credit_card_number(credit_card_number)
    transactions.find_all { |transaction| transaction.credit_card_number == credit_card_number }
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.find_all { |transaction| transaction.credit_card_expiration_date == credit_card_expiration_date }
  end

  def find_all_by_result(result)
    transactions.find_all { |transaction| transaction.result == result }
  end



  private

  def convert_csv_to_transactions(parsed_csv)
    parsed_csv.map { |row| Transaction.new(row, self) }
  end

end
