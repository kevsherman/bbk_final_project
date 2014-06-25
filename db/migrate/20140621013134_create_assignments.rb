class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :guest_id
      t.integer  :sub_event_id
      t.boolean :rsvp
      t.timestamps
    end
  end
end
