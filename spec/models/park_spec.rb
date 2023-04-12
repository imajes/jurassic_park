# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Park do
  subject { build(:isla_nublar) }

  describe 'associations' do
    it { is_expected.to have_many(:paddocks) }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
  end
end
