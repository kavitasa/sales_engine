require_relative './require_helper'
require_relative './customer_parser'
require_relative './finder'

class CustomerRepository
  include Finder

  attr_reader :customers, :sales_engine

  def initialize(sales_engine, customer_parser = CustomerParser.new)
    parsed_csv    = customer_parser.parse_data
    @customers    = convert_csv_to_customers(parsed_csv)
    @sales_engine = sales_engine
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_by_first_name(first_name)
    customers.find { |customer| customer.first_name == first_name }
  end

  def find_by_last_name(last_name)
    customers.find { |customer| customer.last_name == last_name}
  end

  def find_all_by_first_name(first_name)
    customers.find_all { |customer| customer.first_name == first_name }
  end

  def find_all_by_last_name(last_name)
    customers.find_all { |customer| customer.last_name == last_name }
  end

  def find_all_invoices_by_id(id)
    sales_engine.find_all_invoices_by_customer_id(id)
  end

  private

  def convert_csv_to_customers(parsed_csv)
    parsed_csv.map { |row| Customer.new(row, self) }
  end

end
