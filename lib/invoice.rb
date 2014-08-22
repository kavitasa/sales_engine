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

  def transaction
    @repository.sales_engine.transaction_repository.find_all_by_id(self.id)
  end

  def invoice_item
    @repository.sales_engine.invoice_item_repository.find_all_by_id(self.id)
  end


end
