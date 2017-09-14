require 'rails_helper'

feature "When a user visits the vending a single vending machine" do
  scenario "they see a list of vending machine snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    v = sam.machines.create(location: "Turing Basement")

    visit machines_path(v)

    expect(page).to have_content("Turing Basement")
  end
end
