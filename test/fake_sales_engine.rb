require 'pry'
class FakeSalesEngine < SalesEngine

  def initialize
    @merchant_repository     = MerchantRepository.new(self, 'data/test')
    @customer_repository     = CustomerRepository.new(self, 'data/test')
    @invoice_repository      = InvoiceRepository.new(self, 'data/test')
    @invoice_item_repository = InvoiceItemRepository.new(self, 'data/test')
    @item_repository         = ItemRepository.new(self, 'data/test')
    @transaction_repository  = TransactionRepository.new(self, 'data/test')
  end
end
