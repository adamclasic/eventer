class CreateInvitaion < ActiveRecord::Migration[5.2]
  def change
    create_table :invitaions do |t|
      t.integer :event_id, nill: false
      t.integer :user_id, nill: false
      
      t.timestamps
    end
  end
end
