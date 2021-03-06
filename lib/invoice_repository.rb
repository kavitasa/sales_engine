require_relative './require_helper'
require_relative './invoice_parser'


class InvoiceRepository
  include Finder
  include HelperMethods

  attr_reader :invoices, :sales_engine

  def initialize(sales_engine, data_file)
    parsed_csv    = InvoiceParser.new(data_file).parse_data
    @invoices     = convert_csv_to_invoices(parsed_csv)
    @sales_engine = sales_engine
  end

  #Listing & Searching

  def all
    @invoices
  end

  def find_by_customer_id(customer_id)
    invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    invoices.find { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_by_status(status)
    invoices.find { |invoice| invoice.status == status}
  end

  def find_all_by_customer_id(customer_id)
    invoices.find_all { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.find_all { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_status(status)
    invoices.find_all { |invoice| invoice.status == status }
  end

  #Relationships

  def find_all_transactions_by_id(id)
    sales_engine.find_all_transactions_by_invoice_id(id)
  end

  def find_all_invoice_items_by_id(id)
    sales_engine.find_all_invoice_items_by_invoice_id(id)
  end

  def find_customer_by_customer_id(customer_id)
    sales_engine.find_customer_by_customer_id(customer_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    sales_engine.find_merchant_by_merchant_id(merchant_id)
  end

  private

  def convert_csv_to_invoices(parsed_csv)
    parsed_csv.map { |row| Invoice.new(row, self) }
  end
end
