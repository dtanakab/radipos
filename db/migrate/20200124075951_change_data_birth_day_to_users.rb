# frozen_string_literal: true

class ChangeDataBirthDayToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :birth_day, :string
  end
end
