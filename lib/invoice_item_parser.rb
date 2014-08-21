# require_relative './require_helper'
require_relative 'invoice_item'
require 'csv'

class InvoiceItemParser
  attr_reader :file_name

  def initialize(file_name = 'invoice_items.csv')
    @file_name = file_name
  end

  def parse_data
    CSV.open("data/" + "#{file_name}", headers: true, header_converters: :symbol)
  end

end
