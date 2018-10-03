class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees, id: false do |t|
      t.primary_key :emp_id
      t.string :name
      t.string :email, null: false

      t.timestamps
    end
  end
end
