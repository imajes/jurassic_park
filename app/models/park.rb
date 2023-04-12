# frozen_string_literal: true

class Park < ApplicationRecord

  has_many :paddocks, inverse_of: :park, dependent: :destroy

end
