require_relative './require_helper'
require_relative './merchant_parser'
require_relative './finder'
require_relative './randomizer'

class MerchantRepository
  include Finder
  include Randomizer

  attr_reader :merchants, :sales_engine

  def initialize(sales_engine, merchant_parser = MerchantParser.new)
    parsed_csv    = merchant_parser.parse_data
    @merchants    = convert_csv_to_merchants(parsed_csv)
    @sales_engine = sales_engine
  end

  def all
    @merchants
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name == name}
  end

  def find_all_by_name(name)
    merchants.find_all { |merchant| merchant.name == name }
  end


  private

  def convert_csv_to_merchants(parsed_csv)
    parsed_csv.map { |row| Merchant.new(row, self) }
  end

end
