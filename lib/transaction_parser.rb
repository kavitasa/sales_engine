# require_relative './require_helper'
require_relative 'transaction'
require 'csv'

class TransactionParser
  attr_reader :file_name

  def initialize(file_name = 'transactions.csv')
    @file_name = file_name
  end

  def parse_data
    CSV.open("data/" + "#{file_name}", headers: true, header_converters: :symbol)
  end

end
