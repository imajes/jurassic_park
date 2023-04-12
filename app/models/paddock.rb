# frozen_string_literal: true

class Paddock < ApplicationRecord

  enum :power, %i[active down], default: :down

  has_many :dinosaurs, inverse_of: :paddock, dependent: :destroy
  belongs_to :park

  before_validation :ensure_power_is_on
  before_validation :ensure_correct_type_mix
  before_validation :ensure_single_carnivore_species

  validates :dinosaurs, length: { maximum: :capacity }

  def dinosaurs?
    dinosaurs.any?
  end

  def fence_active?
    power == 'active'
  end

  def carnivores?
    dinosaurs.map(&:type).include?('carnivore')
  end

  def herbivores?
    dinosaurs.map(&:type).include?('herbivore')
  end

  def species
    dinosaurs.map(&:species).uniq
  end

  private

  def ensure_power_is_on
    return unless dinosaurs?

    unless fence_active?
      errors.add(:base, :power, message: "The power must be on to protect the dinosaurs.")
      throw(:abort)
    end
  end

  def ensure_correct_type_mix
    if herbivores? && carnivores?
      errors.add(:dinosaurs, :type, message: "Herbivores and Carnivores cannot live together.")
      throw(:abort)
    end
  end

  def ensure_single_carnivore_species
    if carnivores? && species.length > 1
      errors.add(:dinosaurs, :species, message: "Carnivores can only be kept as a single species.")
      throw(:abort)
    end
  end

end
