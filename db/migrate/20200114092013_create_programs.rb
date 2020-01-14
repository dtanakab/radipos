# frozen_string_literal: true

class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :memo
      t.string :email
      t.string :cast
      t.string :date

      t.timestamps
    end
  end
end
