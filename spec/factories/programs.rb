# frozen_string_literal: true

FactoryBot.define do
  factory :program1, class: Program do
    id { 1 }
    title { "TEST番組1" }
    memo { "TEST番組1が始まります" }
    email { "test1@radio.com" }
    cast { "太郎1, 花子1" }
    station { "ニッポン放送" }
    starts_at { Time.new(2020, 2, 1, 03, 05, 00) }
    ends_at { Time.new(2020, 2, 1, 13, 30, 00) }
    hp { "http://test1.program" }
    timeframe { 1 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/files/test.jpg")) }
    on_air_wday_id { 1 }
  end
  factory :program2, class: Program do
    id { 2 }
    title { "TEST番組2" }
    memo { "TEST番組2が始まります" }
    email { "test2@radio.com" }
    cast { "太郎2, 花子2" }
    station { "ニッポン放送" }
    starts_at { Time.new(2020, 2, 1, 03, 05, 00) }
    ends_at { Time.new(2020, 2, 1, 13, 30, 00) }
    hp { "http://test2.program" }
    timeframe { 2 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/files/test.jpg")) }
    on_air_wday_id { 2 }
  end
  factory :program3, class: Program do
    id { 3 }
    title { "TEST番組3" }
    memo { "TEST番組3が始まります" }
    email { "test3@radio.com" }
    cast { "太郎3, 花子3" }
    station { "ニッポン放送" }
    starts_at { Time.new(2020, 2, 1, 03, 05, 00) }
    ends_at { Time.new(2020, 2, 1, 13, 30, 00) }
    hp { "http://test3.program" }
    timeframe { 1 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/files/test.jpg")) }
    on_air_wday_id { 1 }
  end
  factory :program4, class: Program do
    id { 4 }
    title { "TEST番組4" }
    memo { "TEST番組4が始まります" }
    email { "test4@radio.com" }
    cast { "太郎4, 花子4" }
    station { "ニッポン放送" }
    starts_at { Time.new(2020, 2, 1, 03, 05, 00) }
    ends_at { Time.new(2020, 2, 1, 13, 30, 00) }
    hp { "http://test4.program" }
    timeframe { 1 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/files/test.jpg")) }
    on_air_wday_id { 1 }
  end
end
