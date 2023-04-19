class CreateUserTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.datetime :due_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :remarks
      t.integer :status_id
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :user_tasks, :deleted_at
  end
end
