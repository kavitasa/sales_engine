class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id          = row[:id]
    @customer_id = row[:customer_id]
    @merchant_id = row[:merchant_id]
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def transactions
    @repository.sales_engine.transaction_repository.find_all_by_id(id)
  end

  def invoice_items
    @repository.sales_engine.invoice_item_repository.find_all_by_id(id)
  end

  def customer
    @repository.sales_engine.customer_repository.find_by_id(id)
  end

  def merchant
    @repository.sales_engine.merchant_repository.find_by_id(id)
  end

  def items
    # invoice_items.map {|invoice_item| invoice_item.item}
    invoice_items.map(&:item)
  end

end
