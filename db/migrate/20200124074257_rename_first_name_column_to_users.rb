# frozen_string_literal: true

class RenameFirstNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :first_name, :full_name
  end
end
