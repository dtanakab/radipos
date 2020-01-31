# frozen_string_literal: true

class RenameLocalStationToPrograms < ActiveRecord::Migration[6.0]
  def change
    rename_column :programs, :day, :wday
    rename_column :programs, :local_station, :station
  end
end
