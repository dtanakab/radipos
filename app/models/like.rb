# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :program

  scope :filter_by_program, ->(program_id) { where(program_id: program_id) if program_id }
end
