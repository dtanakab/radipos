# frozen_string_literal: true

class CreateOnAirWdays < ActiveRecord::Migration[6.0]
  def change
    create_table :on_air_wdays do |t|
      t.string :str_wday
      t.string :num_wday
      t.timestamps
    end
  end
end
