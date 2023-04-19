class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :password_digest
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :users, :deleted_at
  end
end
