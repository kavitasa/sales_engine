# require_relative './require_helper'
require_relative 'customer'
require 'csv'

class CustomerParser
  attr_reader :file_name

  def initialize(file_name = 'customers.csv')
    @file_name = file_name
  end

  def parse_data
    CSV.open("data/" + "#{file_name}", headers: true, header_converters: :symbol)
  end

end
