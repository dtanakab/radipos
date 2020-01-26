class AddProgramIdToCorners < ActiveRecord::Migration[6.0]
  def change
    add_reference :corners, :program, index: true
  end
end
