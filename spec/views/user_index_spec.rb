require 'rails_helper'

describe 'Index page', type: :feature do
  describe 'In the index page' do

    scenario ' I can see the username of all other users' do
      visit '/'
      expect(page).to have_content('Tom')
    end
    scenario 'I can see the profile picture for each user.' do
      visit '/'
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts' do
      visit '/'
      expect(page).to have_content('Number of posts: 5')
    end

    scenario 'When I click on a user, I am redirected to that users show page.' do
      visit '/'
      first("user-details-link").click
      expect(page).to have_content('Bio')
    end
  end
end