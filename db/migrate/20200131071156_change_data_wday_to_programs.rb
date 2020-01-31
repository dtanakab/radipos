# frozen_string_literal: true

class ChangeDataWdayToPrograms < ActiveRecord::Migration[6.0]
  def change
    change_column :programs, :wday, :integer
  end
end
