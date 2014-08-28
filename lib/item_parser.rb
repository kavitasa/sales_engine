require_relative 'item'
require 'csv'

class ItemParser
  attr_reader :data_file

  def initialize(data_file)
    @data_file = data_file
  end

  def parse_data
    CSV.open("#{data_file}/items.csv", headers: true, header_converters: :symbol)
  end

end
