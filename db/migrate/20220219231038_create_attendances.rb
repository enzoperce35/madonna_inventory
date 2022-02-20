class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.text :note
      t.belongs_to :user

      t.timestamps
    end
  end
end
