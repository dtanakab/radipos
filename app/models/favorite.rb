# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :program
  validates :user, presence: true
  validates :program, presence: true
end
