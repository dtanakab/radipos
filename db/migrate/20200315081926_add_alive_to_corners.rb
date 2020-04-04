# frozen_string_literal: true

class AddAliveToCorners < ActiveRecord::Migration[6.0]
  def change
    remove_column :corners, :alive_flag, :integer
    add_column :corners, :alive, :boolean, default: true
  end
end
