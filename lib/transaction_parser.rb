# require_relative './require_helper'
require_relative 'transaction'
require 'csv'

class TransactionParser

  attr_reader :file_name

  def initialize(file_name = 'transaction.csv')
    @file_name = file_name
  end

  def change_csv_to_transactions
    csv_data = load_data
    convert_data_to_transactions(csv_data)
  end

  def load_data
    CSV.open("data/" + "#{file_name}", headers: true, header_converters: :symbol)
  end

  def convert_data_to_transactions(csv_data)
    csv_data.map do |row|
      Transaction.new(row)
    end
  end

end


## rachel's fake implementation code

# parser = TransactionParser.new('transaction_test_data.csv').change_csv_to_transactions
