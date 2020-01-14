# frozen_string_literal: true

json.extract! program, :id, :title, :memo, :email, :cast, :date, :created_at, :updated_at
json.url program_url(program, format: :json)
