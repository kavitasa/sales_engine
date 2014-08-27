class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id          = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def transactions
    @repository.find_all_transactions_by_id(id)
  end

  def invoice_items
    @repository.find_all_invoice_items_by_id(id)
  end

  def items
    # invoice_items.map {|invoice_item| invoice_item.item}
    invoice_items.map(&:item)
  end

  def customer
    @repository.find_customer_by_customer_id(customer_id)
  end

  # def merchant
  #   @repository.sales_engine.merchant_repository.find_by_id(id)
  # end

  def merchant
    @repository.find_merchant_by_merchant_id(merchant_id)
  end

end
