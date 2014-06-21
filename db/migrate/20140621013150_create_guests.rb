class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :main_event_id
      t.string :email
      t.string :first
      t.string :last
      t.boolean :rsvp, default: nil 
      t.timestamps
    end
  end
end
