# frozen_string_literal: true

class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.add_column :name, :string, null: false
      t.add_index :name, unique: true
    end
  end
end
