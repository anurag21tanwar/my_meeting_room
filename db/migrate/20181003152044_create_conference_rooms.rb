class CreateConferenceRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :conference_rooms do |t|
      t.string :name, null:false

      t.timestamps
    end
  end
end