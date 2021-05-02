class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :group_name
      t.string :first_work
      t.string :second_work
      t.string :third_work
      t.string :fourth_work
      t.string :fifth_work
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
