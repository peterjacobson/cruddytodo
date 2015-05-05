class AddTaskTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :complete?, default: false, null: false
      t.string :priority, default: 'c', null: false
      t.timestamps null: false
    end
  end
end
