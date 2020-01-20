# frozen_string_literal: true

class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :radio_name, :string, null: true
  end
end
