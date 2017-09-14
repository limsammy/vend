require 'rails_helper'

feature "When a user visits a snack page" do
  scenario "they see a list of information" do
    sam = Owner.create(name: "Sam's Snacks")
    m_1 = sam.machines.create(location: "Don's Mixed Drinks")
    m_2 = sam.machines.create(location: "Turing Basement")
    s_1 = m_1.snacks.create(name: 'Cheetos', price: 2.50)
    s_2 = m_1.snacks.create(name: 'Doritos', price: 2.25)

    visit machine_snack_path(s_1)

    expect(current_page).to eq('/machines/1/snacks')
    # As a user
    # When I visit a specific snack page
    # I see the name of that snack
    # I see the price for that snack
    # I see a list of locations with vending machines that carry that snack
    # I see the average price for snacks in those vending machines
    # And I see a count of the different kinds of items in that vending machine.
  end
end
