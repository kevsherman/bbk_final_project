class CreateSubEvents < ActiveRecord::Migration
  def change
    create_table :sub_events do |t|
      t.integer  :main_event_id
      t.string   :title
      t.string   :location
      t.string   :description
      t.date     :date
      t.time     :start_time
      t.time     :end_time
      t.string   :attire
      t.timestamps
    end
  end
end
