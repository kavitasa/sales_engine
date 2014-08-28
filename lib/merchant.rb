class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id].to_i
    @name       = row[:name]
    @created_at = parse_created_at(row[:created_at])
    @updated_at = row[:updated_at]
    @repository = repository
  end

  def items
    @repository.find_all_items_by_id(id)
  end

  def invoices
    @repository.find_all_invoices_by_id(id)
  end

  def revenue_per_merchant
    start_value = BigDecimal.new("0")
    invoices.map(&:total_price_per_invoice).reduce(start_value, :+)
  end

  def revenue(date)
    all_invoices = @repository.find_all_invoices_by_id(id)
    invoices_for_date(all_invoices, date).
      map(&:total_price_per_invoice).
      reduce(BigDecimal.new("0"), :+)
  end

  def items_per_merchant
    invoices.map(&:total_items_per_invoice).reduce(0, :+)
  end

  private

  def parse_created_at(created_at)
    Date.parse(created_at.split(' ')[0])
  end

  def invoices_for_date(invoices, date)
    invoices.select { |invoice| invoice.created_at == date }
  end
end
