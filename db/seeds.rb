# frozen_string_literal: true

require "csv"
require "charlock_holmes"

path = "public/programs_for_seeds_addition.csv"
detection = CharlockHolmes::EncodingDetector.detect(File.read(path))
encoding = detection[:encoding] == "Shift_JIS" ? "CP932" : detection[:encoding]

CSV.foreach(path, encoding: "#{encoding}:UTF-8", headers: true) do |row|
  Program.create(
    title: row["title"],
    memo: row["memo"],
    email: row["email"],
    cast: row["cast"],
    wday: row["wday"],
    station: row["station"],
    starts_at: row["starts_at"],
    ends_at: row["ends_at"],
    hp: row["hp"]
  )
end
