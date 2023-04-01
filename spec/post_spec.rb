require 'rails_helper'

describe Post, type: :model do
  subject do
    Post.new(
      title: 'My first post',
      text: 'Happy coding!',
      comments_counter: 9,
      likes_counter: 12
    )
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be a maximum 250 characters' do
    subject.title = 'c' * 251
    expect(subject).to_not be_valid
  end

  it 'displays most recent comments' do
    subject.comments_counter = 5
    expect(subject.most_recent_comments).to eq(subject.comments.last(5))
  end

  it 'displays likes_counter' do
    subject.likes_counter = 8
    expect(subject.likes_counter).to eq(8)
  end
end
