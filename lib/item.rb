class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = row[:unit_price]
    @merchant_id = row[:merchant_id]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def merchant
    @repository.sales_engine.merchant_repository.find_by_id(merchant_id)
  end

  def invoice_items
    @repository.sales_engine.invoice_item_repository.find_all_by_id(id)
  end

end
