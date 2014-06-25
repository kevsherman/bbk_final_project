class CreateMainEvents < ActiveRecord::Migration
  def change
    create_table :main_events do |t|
      t.integer :user_id
      t.string :title
      t.string :date
      t.string :image
      t.string :link
      t.string :description
      t.integer :start_time
      t.integer :end_time
      t.string :bride_full_name
      t.string :groom_full_name

      t.timestamps
    end
  end
end
