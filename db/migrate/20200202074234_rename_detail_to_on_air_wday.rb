# frozen_string_literal: true

class RenameDetailToOnAirWday < ActiveRecord::Migration[6.0]
  def change
    rename_column :on_air_wdays, :str_wday, :name
    rename_column :on_air_wdays, :num_wday, :code
  end
end
