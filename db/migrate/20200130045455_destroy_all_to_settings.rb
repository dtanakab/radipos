# frozen_string_literal: true

class DestroyAllToSettings < ActiveRecord::Migration[6.0]
  def change
    drop_table :settings
  end
end
