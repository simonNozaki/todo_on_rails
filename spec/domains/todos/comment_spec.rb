require 'rails_helper'

describe 'Comment' do
  Comment = Todos::Types::Comment

  it "should raise runtime error by over 255 chars" do
    comment_str = "raise" * 51 + "e"
    expect { Comment.new(comment_str) }.to raise_error Exceptions::ObjectValidationError
  end

  it "can create comment domain object" do
    expect(Comment.new('share to everyone')).to be_instance_of(Comment)
  end
end
