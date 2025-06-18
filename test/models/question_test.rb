require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "tags_list strips whitespace and ignores blanks" do
    question = Question.new(title: "Example", body: "Body")
    question.tags_list = "ruby,  rails , ,  testing "

    tag_names = question.tags.map(&:name)
    assert_equal ["ruby", "rails", "testing"], tag_names
  end
end
