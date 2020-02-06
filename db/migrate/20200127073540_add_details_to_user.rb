# frozen_string_literal: true

class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :tel, :string
  end
end
