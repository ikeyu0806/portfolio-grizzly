# frozen_string_literal: true

class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.bigint :follow_id
      t.bigint :follower_id

      t.timestamps
    end
    add_foreign_key :relations, :users, column: :follow_id
    add_foreign_key :relations, :users, column: :follower_id
    add_index :relations, %i[follow_id follower_id], unique: true
  end
end
