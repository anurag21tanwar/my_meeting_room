class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :conference_room, index: true
      t.integer :booked_by, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :title, null: false
      t.text :agenda

      t.timestamps
    end
  end
end