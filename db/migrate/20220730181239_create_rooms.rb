class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.string :room_introduction
      t.integer :price
      t.string :city
      t.string :room_image

      t.timestamps
    end
  end
end
