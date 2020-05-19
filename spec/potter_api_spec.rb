require 'rails_helper'

describe "As a user" do
  it "I can select a house and see search results for members of the house who are in the order of the pheonix" do
    visit '/'
    select "Gryffindor", from: "house"
    click_button 'Search For Members'
    expect(current_path).to eql('/search')

    within '.total-members' do
      expect(page).to have_content('Total Members from Gryffindor: 21')
    end

    within '.members-list' do
      within first('.member') do
        expect(page).to have_content('Name:')
        expect(page).to have_content('Role:')
        expect(page).to have_content('House:')
        expect(page).to have_content('Patronus:')
      end
    end
  end
end

# As a user,
# When I visit "/"
# And I Select “Gryffindor” from the select field
# (Note: Use the existing select field)
# And I click "Search For Members“
# Then I should be on page “/search”
# Then I should see the total number of the order of the phoenix members that belong to Gryffindor. (i.e. 21)
# And I should see a list with the detailed information for the 21 members of the Order of the Phoenix for house Gryffindor.
# ​
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
