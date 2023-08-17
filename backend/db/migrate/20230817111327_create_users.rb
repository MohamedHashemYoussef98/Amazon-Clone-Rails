class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true, name: "unique_emails" }, limit: 100
      t.string :password, null: false, limit: 100

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
