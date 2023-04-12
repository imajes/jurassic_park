# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dinosaur do
  let!(:park)        { create(:isla_nublar) }
  let(:paddock)      { create(:paddock) }
  let(:test_species) { [Dinosaur::CARNIVORES + Dinosaur::HERBIVORES].flatten.sample }

  subject { build(:dinosaur) }

  describe 'enums' do
    it { is_expected.to define_enum_for(:species) }
    it { is_expected.to define_enum_for(:type) }
    it { is_expected.to define_enum_for(:gender) }

    it 'redefines the interitance_column' do
      expect(described_class.inheritance_column).to_not eq 'type'
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:paddock).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:species) }

    describe 'with species defined' do
      before do
        subject.species = test_species
      end

      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end
  end
end
