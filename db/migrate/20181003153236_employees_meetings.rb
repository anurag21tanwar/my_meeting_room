class EmployeesMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :employees_meetings, id: false do |t|
      t.belongs_to :meeting
      t.belongs_to :employee
    end
  end
end
