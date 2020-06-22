class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.integer :event_id, nill: false
      t.integer :user_id, nill: false
      
      t.timestamps
    end
  end
end
