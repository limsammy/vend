require 'rails_helper'

feature "When a user visits a snack page" do
  scenario "they see a list of information" do
    sam = Owner.create(name: "Sam's Snacks")
    m_1 = sam.machines.create(location: "Don's Mixed Drinks")
    m_2 = sam.machines.create(location: "Turing Basement")
    s_1 = m_1.snacks.create(name: 'Cheetos', price: 2.50)
    s_2 = m_1.snacks.create(name: 'Doritos', price: 2.25)
    s_3 = m_2.snacks.create(name: 'Lays', price: 2.15)
    MachineSnack.create(snack_id: s_1.id, machine_id: m_2.id)

    visit machine_snack_path(m_1.id, s_1.id)

    expect(current_path).to eq("/machines/#{m_1.id}/snacks/#{s_1.id}")

    expect(page).to have_content(s_1.name)
    expect(page).to have_content(s_1.price)

    expect(page).to have_content(m_1.location)
    expect(page).to have_content(m_2.location)

    expect(page).to have_content("2.375")
    expect(page).to have_content("2.325")
    expect(page).to have_content("Snack Count: #{m_1.snacks.count}")
    expect(page).to have_content("Snack Count: #{m_2.snacks.count}")
  end
end
