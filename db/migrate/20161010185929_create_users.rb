class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :avatar_url
      t.boolean  "active", default: true
      t.integer  "ctigi_auth_uid"
      t.string   "ctigi_auth_access_token"
      t.timestamps null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
