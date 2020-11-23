class ChangeCategoryColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :instruments, :catogory, :category
  end
end
