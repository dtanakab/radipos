# frozen_string_literal: true

class RemoveBirthToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :birth_day, :string
    remove_column :users, :birth_month, :string
    remove_column :users, :birth_year, :string
  end
end
