# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Paddock do
  let!(:park) { create(:isla_nublar) }

  subject { build(:paddock) }

  describe 'associations' do
    it { is_expected.to belong_to(:park) }
    it { is_expected.to have_many(:dinosaurs) }
  end

  describe 'conditions' do
    before do
      subject.update(capacity: 2, power: :active, dinosaurs: [])
    end

    describe 'when enforcing capacity' do
      it { is_expected.to validate_length_of(:dinosaurs) }

      it 'invalidates and throws the correct error' do
        subject.dinosaurs = build_list(:dinosaur, 3, :carnivore, :velociraptor)

        expect(subject).to_not be_valid
        expect(subject.errors).to be_added(:dinosaurs, :too_long, count: 2)
      end
    end

    describe 'when ensuring power on before dinosaurs are added' do
      before do
        subject.update(capacity: 2, power: :down, dinosaurs: [])
      end

      it "remains valid, as there are no dinosaurs present" do
        expect(subject).to be_valid
      end

      it "becomes invalid, when dinosaurs are added" do
        subject.dinosaurs = build_list(:dinosaur, 2, :carnivore, :velociraptor)

        expect(subject).not_to be_valid
        expect(subject.errors).to be_added(:base, :power)
      end
    end

    describe 'when ensuring power on before dinos are added' do
      before do
        subject.update(capacity: 2, power: :active, dinosaurs: create_list(:dinosaur, 2, :carnivore, :velociraptor))
      end

      it "should start in a valid state" do
        expect(subject).to be_valid
      end

      it "should prevent turning the power off" do
        subject.power = 'down'

        expect(subject).to_not be_valid
        expect(subject.errors).to be_added(:base, :power)
      end
    end

    describe 'species and type mix' do
      it 'ensures carnivores must only be single species' do
        subject.dinosaurs = [build(:dinosaur, :carnivore, :velociraptor), build(:dinosaur, :carnivore, :trex)]

        expect(subject).to_not be_valid
        expect(subject.errors).to be_added(:dinosaurs, :species)
      end

      it 'ensures herbivores cannot be kept with carnivores' do
        subject.dinosaurs = [build(:dinosaur, :carnivore), build(:dinosaur, :herbivore)]

        expect(subject).not_to be_valid
        expect(subject.errors).to be_added(:dinosaurs, :type)

      end

      it 'ensures herbivores can live with other vegesauruses' do
        subject.dinosaurs = build_list(:dinosaur, 2, :herbivore)

        expect(subject).to be_valid
      end
    end
  end

  describe 'knows how many dinosaurs it contains' do
  end
end
