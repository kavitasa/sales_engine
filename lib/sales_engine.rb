require 'csv'
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
              :transaction_repository

  def initialize
    @merchant_repository     ||= MerchantRepository.new(self)
    @customer_repository     ||= CustomerRepository.new(self)
    @invoice_repository      ||= InvoiceRepository.new(self)
    @invoice_item_repository ||= InvoiceItemRepository.new(self)
    @item_repository         ||= ItemRepository.new(self)
    @transaction_repository  ||= TransactionRepository.new(self)
  end

  def startup
  end

end
