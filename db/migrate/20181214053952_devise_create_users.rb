# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, bulk: true do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.timestamps null: false
    end
    change_table :users, bulk: true do |t|
      t.index :email,                unique: true
      t.index :reset_password_token, unique: true
    end
  end
end
