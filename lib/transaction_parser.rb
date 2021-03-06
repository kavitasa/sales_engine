require_relative 'transaction'
require 'csv'

class TransactionParser
  attr_reader :data_file

  def initialize(data_file)
    @data_file = data_file
  end

  def parse_data
    CSV.open("#{data_file}/transactions.csv", headers: true, header_converters: :symbol)
  end

end
