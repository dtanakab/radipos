# frozen_string_literal: true

class AddOnAirWdaysIdToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_reference :programs, :on_air_wday, index: true
  end
end
