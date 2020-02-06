# frozen_string_literal: true

class AddPostableFlagToCorners < ActiveRecord::Migration[6.0]
  def change
    add_column :corners, :postable_flag, :integer
  end
end
