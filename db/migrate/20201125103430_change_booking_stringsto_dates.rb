class ChangeBookingStringstoDates < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :begin_date
    add_column :bookings, :begin_date, :date
    remove_column :bookings, :end_date
    add_column :bookings, :end_date, :date
  end
end
