class AddConfidenceToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :confidence, :integer, default: 0
  end
end
