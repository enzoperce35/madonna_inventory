module InventoryUpdatesHelper
  def create_dots
    '.' * 200
  end

  def target_branch_is_on(update)
    update.updated_branch.present?
  end
end
