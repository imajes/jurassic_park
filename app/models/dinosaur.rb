class Dinosaur < ApplicationRecord

  CARNIVORES = %i(tyrannosaurus velociraptor spinosaurus megalosaurus)
  HERBIVORES = %i(brachiosaurus stegosaurus vegisaurus ankylosaurus triceratops)

  enum :species, [CARNIVORES + HERBIVORES].flatten
  enum :type, %i(carnivore herbivore)
  enum :gender, %i(male female), default: :female # males cannot exist in the park unless we make it


  before_create :set_type



  private

  def set_type
    self.type = CARNIVORES.include?(species.to_sym) ? :carnivore : :herbivore
  end
  


end
