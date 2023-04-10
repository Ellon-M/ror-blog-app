require 'rails_helper'

describe 'show posts tests', type: :feature do
  describe 'test for post show' do
    before(:each) do
      @user1 = User.create(
        name: 'Tommy',
        photo: 'https://picsum.photos/300/200',
        bio: 'Teacher from New Zealand'
      )
      @post1 = Post.create(
        author_id: @user1.id,
        title: 'Hello',
        text: 'Hello World!'
      )

      Comment.create(user_id: @user1.id, post_id: @post1.id, text: 'So relevant. Keep it up!')
      Like.create(user_id: @user1.id, post_id: @post1.id)

      visit user_post_path(@user1, @post1)
    end

    scenario 'I can see the post title.' do
      expect(page).to have_content(@post1.title)
    end

    scenario 'I can see who wrote the post' do
      expect(page).to have_content(@post1.user.name)
    end

    scenario 'I can see how many comments it has.' do
      expect(page).to have_content("Comments: #{@post1.comments_counter + 1}")
    end

    scenario 'I can see how many likes it has.' do
      expect(page).to have_content("Likes: #{@post1.likes_counter + 1}")
    end
    scenario 'I can see the post body.' do
      expect(page).to have_content(@post1.text)
    end

    scenario 'I can see the username of each commentor.' do
      @post1.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    scenario 'I can see the comment each commentor left.' do
      @post1.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
