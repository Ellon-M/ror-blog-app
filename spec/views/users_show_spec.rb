require 'rails_helper'

describe 'show user', type: :feature do
  describe 'For user show' do
    before(:each) do
       visit '/'
      end
    scenario 'I can see the user profile picture.' do
        first(".user-details-link").click
        page.has_selector?('img')
    end

    scenario 'I can see the number of posts' do
      first(".user-details-link").click
      expect(page).to have_content('number of posts')
    end


    scenario 'I can see the user username.' do
        first(".user-details-link").click
        expect(page).to have_content(@user)
    end

    scenario 'I can see user bio' do
        first(".user-details-link").click
        expect(page).to have_content('bio')
    end

    scenario 'When I click to on post i see that post page' do
      first(".user-details-link").click
      click_link('')
      expect(page.current_path).to eql("/users/1/posts")
    end

    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
      first(".see-all-posts-link").click
      first(".see-all-posts-link").click
      expect(page.current_path).to eql("/users/1/posts")
    end
  end
end