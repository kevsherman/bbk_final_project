class CreateMainEvents < ActiveRecord::Migration
  def change
    create_table :main_events do |t|
      t.integer :user_id
      t.string :title
      t.string :image
      t.string :link
      t.string :description
      t.string :bride_full_name
      t.string :groom_full_name
      t.boolean :rsvp_sent, default: false
      t.timestamps
    end
  end
end
