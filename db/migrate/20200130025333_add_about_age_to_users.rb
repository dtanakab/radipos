# frozen_string_literal: true

class AddAboutAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about_age, :string
  end
end
