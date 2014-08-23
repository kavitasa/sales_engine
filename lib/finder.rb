module Finder

  def find_by_id(id)
    all.find { |repository_item| repository_item.id == id }
  end

  def find_by_created_at(created_at)
    all.find { |repository_item| repository_item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    all.find { |repository_item| repository_item.updated_at == updated_at }
  end

  def find_all_by_id(id)
    all.find_all { |repository_item| repository_item.id == id }
  end

  def find_all_by_created_at(created_at)
    all.find_all { |repository_item| repository_item.created_at == created_at }
  end

  def find_all_by_updated_at(updated_at)
    all.find_all { |repository_item| repository_item.updated_at == updated_at }
  end

end
