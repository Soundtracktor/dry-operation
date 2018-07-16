class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.datetime :subscription_paid_at
      t.string :subscription_uid
      t.string :password_digest

      t.timestamps
    end
  end
end
