require_relative './require_helper'
require_relative './merchant_parser'
require_relative './finder'
require_relative './helper_methods'

class MerchantRepository
  include Finder
  include HelperMethods

  attr_reader :merchants, :sales_engine

  def initialize(sales_engine, data_file)
    parsed_csv    = MerchantParser.new(data_file).parse_data
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

  #Business Intelligence

  def calculate_total_revenue_per_merchant
    invoice_revenue = sales_engine.calculate_total_invoice_revenue_per_merchant(id)
  end

  def most_revenue(x)
    ranked_merchants = merchants.sort_by { |merchant| merchant.revenue }
    top_merchants = ranked_merchants[0..(x-1)]
  end

  def most_items(x)
    ranked_merchants = merchants.sort_by { |merchant| merchant.total_items }
    top_merchants = ranked_merchants[0..(x-1)]
  end

  def revenue(date)
    merchants.reduce(0) do |revenue, merchant|
       revenue + merchant.revenue(date)
     end
  end

  private

  def convert_csv_to_merchants(parsed_csv)
    parsed_csv.map { |row| Merchant.new(row, self) }
  end

end
