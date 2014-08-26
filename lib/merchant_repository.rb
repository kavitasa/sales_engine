require_relative './require_helper'
require_relative './merchant_parser'
require_relative './finder'
require_relative './helper_methods'

class MerchantRepository
  include Finder
  include HelperMethods

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

  #Relationships

  def find_all_items_by_id(id)
    sales_engine.find_all_items_by_merchant_id(id)
  end

  def find_all_invoices_by_id(id)
    sales_engine.find_all_invoices_by_merchant_id(id)
  end


  private

  def convert_csv_to_merchants(parsed_csv)
    parsed_csv.map { |row| Merchant.new(row, self) }
  end

end
