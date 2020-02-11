# frozen_string_literal: true

class RenameNameColumnToOnAirWdays < ActiveRecord::Migration[6.0]
  def change
    rename_column :on_air_wdays, :name, :display_str
  end
end
