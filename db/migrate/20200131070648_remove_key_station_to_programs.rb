# frozen_string_literal: true

class RemoveKeyStationToPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :key_station, :string
  end
end
