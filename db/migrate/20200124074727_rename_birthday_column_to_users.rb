# frozen_string_literal: true

class RenameBirthdayColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :birthday, :birth_day
  end
end
