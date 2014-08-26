class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repository = repository
  end

  def items
    @repository.find_all_items_by_id(id)
  end

  # def invoice
  #   @repository.sales_engine.invoice_repository.find_all_by_id(self.id)
  # end

  def invoices
    @repository.find_all_invoices_by_id(id)
  end

end
