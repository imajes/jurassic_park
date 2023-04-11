require 'rails_helper'

RSpec.describe Paddock, type: :model do
  let!(:park) { create(:isla_nublar) }

  subject { build(:paddock) }

  describe "associations" do
    it { is_expected.to belong_to(:park) }
    it { is_expected.to have_many(:dinosaurs) }
  end

  describe "validations" do

    describe "ensuring a paddock can only contain less than the max capacity" do

      before do
        subject.update(capacity: 2, dinosaurs: [])
      end

      it "ensures no more than the max capacity of dinosaurs can be associated" do
        expect(subject).to validate_length_of(:dinosaurs).is_at_most(2)
      end

    end
  end
end
