require_relative './require_helper'
require_relative './customer_parser'

class CustomerRepository
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

  def find_by_id(id)
    customers.find { |customer| customer.id == id }
  end

  def find_by_first_name(first_name)
    customers.find { |customer| customer.first_name == first_name }
  end

  def find_by_last_name(last_name)
    customers.find { |customer| customer.last_name == last_name}
  end

  def find_by_created_at(created_at)
    customers.find { |customer| customer.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    customers.find { |customer| customer.updated_at == updated_at }
  end

  def find_all_by_id(id)
    customers.find_all { |customer| customer.id == id }
  end

  def find_all_by_first_name(first_name)
    customers.find_all { |customer| customer.first_name == first_name }
  end

  def find_all_by_last_name(last_name)
    customers.find_all { |customer| customer.last_name == last_name }
  end

  def find_all_by_created_at(created_at)
    customers.find_all { |customer| customer.created_at == created_at }
  end

  def find_all_by_updated_at(updated_at)
    customers.find_all { |customer| customer.updated_at == updated_at }
  end

  private

  def convert_csv_to_customers(parsed_csv)
    parsed_csv.map { |row| Customer.new(row, self) }
  end
  
end
