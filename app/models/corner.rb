# frozen_string_literal: true

class Corner < ApplicationRecord
  belongs_to :program
  has_many :posts, dependent: :destroy

end
