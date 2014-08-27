class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id].to_i
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repository = repository
  end

  def items
    @repository.find_all_items_by_id(id)
  end

  def invoices
    @repository.find_all_invoices_by_id(id)
  end

  def revenue
    start_value = BigDecimal.new("0")
    invoices.map(&:total).reduce(start_value, :+)
  end
end
