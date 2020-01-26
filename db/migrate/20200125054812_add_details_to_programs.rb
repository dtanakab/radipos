class AddDetailsToPrograms < ActiveRecord::Migration[6.0]
  def change
    add_column :programs, :key_station, :string
    add_column :programs, :local_station, :string
    add_column :programs, :starts_at, :time
    add_column :programs, :ends_at, :time
  end
end
