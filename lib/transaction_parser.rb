# require_relative './require_helper'
require_relative 'transaction'
require 'csv'

class TransactionParser

  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def change_csv_to_transactions
    convert_data_to_transactions(data)
  end

  def data
    CSV.open("data/" + "#{file_name}", headers: true, header_converters: :symbol)
  end

  def convert_data_to_transactions(data)
    data.map { |row| Transaction.new(row) }
  end
end


## rachel's fake implementation code

# parser = TransactionParser.new('transaction_test_data.csv').change_csv_to_transactions
