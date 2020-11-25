class RemoveCatogoryFromInstruments < ActiveRecord::Migration[6.0]
  def change
    remove_column :instruments, :category, :string
  end
end
