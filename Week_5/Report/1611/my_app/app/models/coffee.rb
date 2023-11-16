# frozen_string_literal: true

class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w[small medium large],
                                message: '%<value>s is not a valid size' }, allow_nil: true
end
