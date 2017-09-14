class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price(machine_id)
    machine = Machine.find(machine_id)
    machine.snacks.average(:price)
  end
end
