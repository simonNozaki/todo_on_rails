require 'test_helper'

class CommentTest < ActionDispatch::IntegrationTest
  include Todos::Types

  test "should raise runtime error by over 255 chars" do
    comment_str = "raise" * 51 + "e"
    assert_raises(Exceptions::ObjectValidationError) { Comment.new(comment_str) }
  end

  test "can create comment domain object" do
    assert_instance_of Comment,  Comment.new('share to anyone')
  end
end
