require_relative 'invoice_item'
require 'csv'

class InvoiceItemParser
  attr_reader :data_file

  def initialize(data_file)
    @data_file = data_file
  end

  def parse_data
    CSV.open("#{data_file}/invoice_items.csv", headers: true, header_converters: :symbol)
  end

end
