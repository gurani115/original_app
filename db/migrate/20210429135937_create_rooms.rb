class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :group_name,   null: false
      t.string :species,      null: false
      t.string :first_work,   null: false
      t.string :second_work
      t.string :third_work
      t.string :fourth_work
      t.string :fifth_work
      t.string :first_text,   null: false
      t.string :second_text
      t.string :third_text
      t.string :fourth_text
      t.string :fifth_text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
