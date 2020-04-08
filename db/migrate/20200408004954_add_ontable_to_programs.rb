# frozen_string_literal: true

class AddOntableToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_column :programs, :on_timetable, :boolean, default: true
  end
end
