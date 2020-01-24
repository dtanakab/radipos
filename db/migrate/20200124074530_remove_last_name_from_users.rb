# frozen_string_literal: true

class RemoveLastNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :last_name, :string
  end
end
