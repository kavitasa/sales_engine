class FakeSalesEngine < SalesEngine

  def initialize
    merchant_parser          = MerchantParser.new('data/test/merchants.csv')
    @merchant_repository     = MerchantRepository.new(self, merchant_parser)

    customer_parser          = CustomerParser.new('data/test/customers.csv')
    @customer_repository     = CustomerRepository.new(self, customer_parser)

    invoice_parser           = InvoiceParser.new('data/test/invoices.csv')
    @invoice_repository      = InvoiceRepository.new(self, invoice_parser)

    invoice_item_parser      = InvoiceItemParser.new('data/test/invoice_items.csv')
    @invoice_item_repository = InvoiceItemRepository.new(self, invoice_item_parser)

    item_parser              = ItemParser.new('data/test/items.csv')
    @item_repository         = ItemRepository.new(self, item_parser)

    transaction_parser       = TransactionParser.new('data/test/transactions.csv')
    @transaction_repository  = TransactionRepository.new(self, transaction_parser)
  end
end
