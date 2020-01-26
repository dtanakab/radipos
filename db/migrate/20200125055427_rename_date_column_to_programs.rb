# frozen_string_literal: true

class RenameDateColumnToPrograms < ActiveRecord::Migration[6.0]
  def change
    rename_column :programs, :date, :day
  end
end
