require_relative './require_helper'
require_relative './merchant_parser'

class MerchantRepository
  attr_reader :merchants

  def initialize(merchant_parser = MerchantParser.new)
    parsed_csv = merchant_parser.parse_data
    @merchants = convert_csv_to_merchants(parsed_csv)
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
  end

  def find_by_id(id)
    merchants.find { |merchant| merchant.id == id }
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name == name}
  end

  def find_by_created_at(created_at)
    merchants.find { |merchant| merchant.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    merchants.find { |merchant| merchant.updated_at == updated_at }
  end

  def find_all_by_id(id)
    merchants.find_all { |merchant| merchant.id == id }
  end

  def find_all_by_name(name)
    merchants.find_all { |merchant| merchant.name == name }
  end

  def find_all_by_created_at(created_at)
    merchants.find_all { |merchant| merchant.created_at == created_at }
  end

  def find_all_by_updated_at(updated_at)
    merchants.find_all { |merchant| merchant.updated_at == updated_at }
  end

  private

  def convert_csv_to_merchants(parsed_csv)
    parsed_csv.map { |row| Merchant .new(row) }
  end
end
