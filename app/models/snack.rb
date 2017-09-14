class Snack < ApplicationRecord
  belongs_to :machine

  def self.average_price(machine_id)
    machine = Machine.find(machine_id)
    machine.snacks.average(:price)
  end
end
