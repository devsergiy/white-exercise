class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :group_events do |t|
      t.string   :name
      t.text     :description
      t.string   :location
      t.datetime :start_at
      t.datetime :end_at
      t.integer  :duration
      t.integer  :status, default: 0
      t.boolean  :removed, default: false

      t.timestamps null: false
    end
  end
end
