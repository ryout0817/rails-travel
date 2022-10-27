class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_day
      t.date :finish_day
      t.integer :people
      t.integer :user_id
      t.integer :room_id
      t.integer :total_amount
      t.timestamps
    end
  end
end
