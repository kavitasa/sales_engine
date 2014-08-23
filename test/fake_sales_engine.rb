class FakeSalesEngine < SalesEngine

  def initialize
    merchant_parser          = MerchantParser.new('test/merchant_test_data.csv')
    @merchant_repository     = MerchantRepository.new(self, merchant_parser)

    customer_parser          = CustomerParser.new('test/customer_test_data.csv')
    @customer_repository     = CustomerRepository.new(self, customer_parser)

    invoice_parser           = InvoiceParser.new('test/invoice_test_data.csv')
    @invoice_repository      = InvoiceRepository.new(self, invoice_parser)

    invoice_item_parser      = InvoiceItemParser.new('test/invoice_item_test_data.csv')
    @invoice_item_repository = InvoiceItemRepository.new(self, invoice_item_parser)

    item_parser              = ItemParser.new('test/item_test_data.csv')
    @item_repository         = ItemRepository.new(self, item_parser)

    transaction_parser       = TransactionParser.new('test/transaction_test_data.csv')
    @transaction_repository  = TransactionRepository.new(self, transaction_parser)
  end
end
