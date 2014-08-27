# require_relative './require_helper'
require_relative 'customer'
require 'csv'

class CustomerParser
  attr_reader :data_file

  def initialize(data_file)
    @data_file = data_file
  end

  def parse_data
    CSV.open("#{data_file}/customers.csv" , headers: true, header_converters: :symbol)
  end
end
