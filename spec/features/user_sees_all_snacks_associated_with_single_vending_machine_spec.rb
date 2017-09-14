require 'rails_helper'

feature "When a user visits the vending a single vending machine" do
  scenario "they see a list of vending machine snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Turing Basement")
    snack_1 = machine.snacks.create(name: 'Cheetos', price: 2.50)
    snack_2 = machine.snacks.create(name: 'Doritos', price: 2.25)

    visit machine_path(machine)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)

    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
  end

  scenario "they see an average price of all snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Turing Basement")
    snack_1 = machine.snacks.create(name: 'Cheetos', price: 2.50)
    snack_2 = machine.snacks.create(name: 'Doritos', price: 2.25)

    visit machine_path(machine)

    expect(page).to have_content((snack_1.price + snack_2.price)/Snack.count)
  end
end
