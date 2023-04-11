class Dinosaur < ApplicationRecord

  CARNIVORES = %i(tyrannosaurus velociraptor spinosaurus megalosaurus)
  HERBIVORES = %i(brachiosaurus stegosaurus vegisaurus ankylosaurus triceratops)

  enum :species, [CARNIVORES + HERBIVORES].flatten
  enum :type, %i(carnivore herbivore)
  enum :gender, %i(male female), default: :female # males cannot exist in the park unless we make it

  self.inheritance_column = :other_type

  belongs_to :paddock, inverse_of: :dinosaurs

  before_create :set_type

  validates :name, presence: true, uniqueness: true

  private

  def set_type
    self.type = CARNIVORES.include?(species.to_sym) ? :carnivore : :herbivore
  end
  


end
