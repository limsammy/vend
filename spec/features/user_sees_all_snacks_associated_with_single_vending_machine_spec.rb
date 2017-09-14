require 'rails_helper'

feature "When a user visits the vending a single vending machine" do
  scenario "they see a list of vending machine snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    v = sam.machines.create(location: "Turing Basement")
    snack_1 = Snack.create(name: 'Cheetos', price: 2.50)
    snack_2 = Snack.create(name: 'Doritos', price: 2.25)

    visit machine_path(v)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)

    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
  end
end
