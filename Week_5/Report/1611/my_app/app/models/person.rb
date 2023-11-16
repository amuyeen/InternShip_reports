# frozen_string_literal: true

class Person < ApplicationRecord
  validates :name, presence: { message: 'must be given please' }
  validates :age, numericality: { message: '%<value>s seems wrong' }
end
