require 'rails_helper'

describe 'index post tests', type: :feature do
  describe 'test for post index' do
    before(:each) do
      @user = User.create(
        id: 2,
        name: 'Tomas',
        photo: 'https://picsum.photos/300/200',
        bio: 'Teacher in Italy',
        posts_counter: 3
      )

      visit user_posts_path(@user)

      @second_post = Post.create(
        id: 2,
        title: 'First post',
        text: 'This is my first post',
        author_id: @user.id
      )

      @first_comment = Comment.create(
        post_id: @second_post.id,
        user_id: @user.id,
        text: 'Thanks!'
      )
    end

    scenario 'I can see the users profile picture.' do
      visit user_posts_path(@user)
      expect(page).to have_css('img')
    end

    scenario 'I can see the users username.' do
      expect(page).to have_content(@user.name)
    end

    scenario 'I can see the number of posts the user has written.' do
      visit user_posts_path(@user)
      expect(page).to have_content(@user.name)
    end

    scenario 'I can see a posts title' do
      visit user_posts_path(@user)
      expect(page).to have_link('Post')
    end

    scenario 'I can see some of the posts body.' do
      visit user_posts_path(@user)
      expect(page).to have_content(@second_post.text)
    end

    scenario 'I can see the first comments on a post' do
      visit user_posts_path(@user)
      expect(page).to have_content(@first_comment.text)
    end

    scenario 'I can see how many comments a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content(@second_post.comments_counter)
    end

    scenario 'I can see how many likes a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content(@second_post.likes_counter)
    end

    scenario 'I can see a section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(@user)
      expect(page).to have_css('.will-paginate')
    end

    scenario 'When I click on a post, it redirects me to that posts show page.' do
      visit user_posts_path(@user)
      click_link('Post')
      expect(page).to have_content('Comments')
    end
  end
end
