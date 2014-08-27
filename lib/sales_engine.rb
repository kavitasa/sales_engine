require 'csv'
require 'bigdecimal'
require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'item_repository'
require_relative 'transaction_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :transaction_repository,
              :data_file

  def initialize(data_file = nil)
    @data_file = data_file
  end

  def startup
    @merchant_repository     ||= MerchantRepository.new(   self, data_file)
    @customer_repository     ||= CustomerRepository.new(   self, data_file)
    @invoice_repository      ||= InvoiceRepository.new(    self, data_file)
    @invoice_item_repository ||= InvoiceItemRepository.new(self, data_file)
    @item_repository         ||= ItemRepository.new(       self, data_file)
    @transaction_repository  ||= TransactionRepository.new(self, data_file)
    self
  end

  #Customer

  def find_all_invoices_by_customer_id(customer_id)
    invoice_repository.find_all_by_customer_id(customer_id)
  end

  #InvoiceItem

  def find_invoice_by_invoice_id(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def find_item_by_item_id(item_id)
    item_repository.find_by_id(item_id)
  end

  #Invoice

  def find_all_transactions_by_invoice_id(invoice_id)
    transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_all_invoice_items_by_invoice_id(invoice_id)
    invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_customer_by_customer_id(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  #Item

  def find_all_invoice_items_by_item_id(item_id)
    invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  #Merchant

  def find_all_items_by_merchant_id(merchant_id)
    item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  #Transaction
  #find_invoice_by_invoice_id already implemented for InvoiceItem

end
