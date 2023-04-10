require 'rails_helper'

describe 'show user', type: :feature do
  describe 'For user show' do
    before(:each) do
      @user = User.create(
        name: 'Tom',
        photo: 'https://images.pexels.com/photos/4050426/pexels-photo-4050426.jpeg',
        bio: 'Teacher in Mexico',
        posts_counter: 2
      )
      @post = Post.create(
        author_id: 1,
        title: 'Hello',
        text: 'My first post'
      )
      visit '/'
    end

    scenario 'I can see the user profile picture.' do
        first(".user-details-link").click
        page.has_selector?('img')
    end

    scenario 'I can see the number of posts' do
      first(".user-details-link").click
      expect(page).to have_content('Number of posts')
    end


    scenario 'I can see the user username.' do
        first(".user-details-link").click
        expect(page).to have_content(@user.name)
    end

    scenario 'I can see user bio' do
        first(".user-details-link").click
        expect(page).to have_content('Bio')
    end

    scenario 'I can see the user first 3 posts' do
      expect(page).to have_content(@user.posts_counter.order(created_at: :desc).limit(3))
    end

    scenario 'When I click a user post, it redirects me to that post show page' do
      first(".user-details-link").click
      click_link('.post_link')
      expect(page.current_path).to eql("/users/1/posts")
    end

    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
      first(".user-details-link").click
      click_link('See all posts')
      page.has_selector?(".posts")
    end
  end
end