class AddStatusToNotebooks < ActiveRecord::Migration[5.2]
  def change
    add_column :notebooks, :status, :integer, default: 0
  end
end
