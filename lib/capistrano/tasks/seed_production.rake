# frozen_string_literal: true

Dir.glob(File.join("db", "seeds", "*.rb")).each do |file|
  desc "Load the seed data from db/seeds/#{File.basename(file)}."
  task "db:seed:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    load(file)
  end
end
