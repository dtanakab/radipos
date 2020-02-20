# frozen_string_literal: true

class ChangeDataAliveFlagFromCorners < ActiveRecord::Migration[6.0]
  def change
    change_column :corners, :alive_flag, :boolean, default: true
    rename_column :corners, :alive_flag, :alive
  end
end
