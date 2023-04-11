class Paddock < ApplicationRecord

  enum :power, %i(active down), default: :down

  has_many :dinosaurs, inverse_of: :paddock
  belongs_to :park

  validates :dinosaurs, length: { maximum: :capacity }

  def has_carnivores?
    dinosaurs.map(&:type).include?("carnivore")
  end

  def species
    dinosaurs.map(&:species).uniq
  end


  private



end
