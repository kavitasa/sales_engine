require_relative './require_helper'
require_relative './invoice_parser'

class InvoiceRepository
  attr_reader :invoices

  def initialize(invoice_parser = InvoiceParser.new)
    parsed_csv = invoice_parser.parse_data
    @invoices = convert_csv_to_invoices(parsed_csv)
  end

  def all
    @invoices
  end

  def random
    @invoices.sample
  end

  def find_by_id(id)
    invoices.find { |invoice| invoice.id == id }
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

  def find_by_created_at(created_at)
    invoices.find { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def find_all_by_id(id)
    invoices.find_all { |invoice| invoice.id == id }
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

  def find_all_by_created_at(created_at)
    invoices.find_all { |invoice| invoice.created_at == created_at }
  end

  def find_all_by_updated_at(updated_at)
    invoices.find_all { |invoice| invoice.updated_at == updated_at }
  end

  private

  def convert_csv_to_invoices(parsed_csv)
    parsed_csv.map { |row| Invoice.new(row) }
  end
end
