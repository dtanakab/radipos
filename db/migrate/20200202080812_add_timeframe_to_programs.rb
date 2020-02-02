# frozen_string_literal: true

class AddTimeframeToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_column :programs, :timeframe, :integer
  end
end
