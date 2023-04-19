class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.datetime :due_date
      t.integer :status_id
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tasks, :deleted_at
  end
end
