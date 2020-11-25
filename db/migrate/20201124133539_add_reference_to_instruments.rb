class AddReferenceToInstruments < ActiveRecord::Migration[6.0]
  def change
    add_reference :instruments, :category, null: false, foreign_key: true
  end
end
