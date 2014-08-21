# require_relative './require_helper'
require_relative 'item'
require 'csv'

class ItemParser
  attr_reader :file_name

  def initialize(file_name = 'items.csv')
    @file_name = file_name
  end

  def parse_data
    CSV.open("data/" + "#{file_name}", headers: true, header_converters: :symbol)
  end

end
