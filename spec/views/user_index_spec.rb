require 'rails_helper'

describe 'Index page', type: :feature do
  describe 'In the index page' do\
    before :each do
      @user = User.create(
        name: 'Tom',
        photo: 'https://images.pexels.com/photos/4050426/pexels-photo-4050426.jpeg',
        bio: 'Teacher in Mexico',
        posts_counter: 2
      )
    end

    scenario ' I can see the username of all other users' do
      visit '/'
      expect(page).to have_text('Tom')
    end

    scenario 'I can see the profile picture for each user.' do
      visit '/'
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts' do
      visit '/'
      expect(page).to have_content('Number of posts: 2')
    end

    scenario 'When I click on a user, I am redirected to that users show page.' do
      visit '/'
      first(".user-details-link").click
      expect(page).to have_content('Bio')
    end
  end
end