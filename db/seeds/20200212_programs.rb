# frozen_string_literal: true

require "csv"
require "charlock_holmes"

path = "public/seeds_data/programs_all.csv"
detection = CharlockHolmes::EncodingDetector.detect(File.read(path))
encoding = detection[:encoding] == "Shift_JIS" ? "CP932" : detection[:encoding]

CSV.foreach(path, encoding: "#{encoding}:UTF-8", headers: true) do |row|
  program = Program.create(
    title: row["title"],
    memo: row["memo"],
    email: row["email"],
    cast: row["cast"],
    station: row["station"],
    starts_at: row["starts_at"],
    ends_at: row["ends_at"],
    hp: row["hp"],
    on_air_wday_id: row["on_air_wday_id"],
    timeframe: row["timeframe"]
  )
  program.image.attach(io: File.open("#{Rails.root}/db/fixtures/program_image/#{row['image']}.jpg"), filename: "#{row['image']}.jpg")
  program.save
end
