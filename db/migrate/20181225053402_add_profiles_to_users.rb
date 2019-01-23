# frozen_string_literal: true

class AddProfilesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
  end
end
