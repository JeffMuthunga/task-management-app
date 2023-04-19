class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :statuses, :deleted_at
  end
end
