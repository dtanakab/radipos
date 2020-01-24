# frozen_string_literal: true

class AddBirthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_year, :string
    add_column :users, :birth_month, :string
  end
end
