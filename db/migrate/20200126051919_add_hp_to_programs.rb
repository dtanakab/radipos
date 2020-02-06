# frozen_string_literal: true

class AddHpToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_column :programs, :hp, :string
  end
end
