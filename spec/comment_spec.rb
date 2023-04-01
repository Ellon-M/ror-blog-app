require 'rails_helper'

describe Comment, type: :model do
  it 'increments comments_counter' do
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

    comment = Comment.new(
      user_id: user.id,
      post_id: post.id,
      text: 'Excellent!'
    )
    comment.save

    expect(post.comments_counter).to eq(4)
  end
end
