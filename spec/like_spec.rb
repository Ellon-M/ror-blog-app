require 'rails_helper'

describe Like, type: :model do
  it 'increments likes_counter' do
    user = User.new(
      name: 'Maurice Law',
      bio: 'Frontend Dev',
      posts_counter: 5
    )
    user.save

    post = Post.new(
      title: 'My first post',
      text: 'Happy coding!',
      comments_counter: 4,
      likes_counter: 6,
      author_id: user.id
    )
    post.save

    like = Like.new(
      user_id: user.id,
      post_id: post.id
    )
    like.save

    expect(post.likes_counter).to eq(6)
  end
end