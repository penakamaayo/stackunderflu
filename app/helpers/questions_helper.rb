module QuestionsHelper
  def link_tag tags
    tag_names = tags.split(", ")

    result = []

    tag_names.each do |tag|
      result << convert_to_link(tag)
    end
    
    result.join(", ")
  end


  private
  def convert_to_link tag
    link_to tag, tag_path(tag).html_safe
  end
end
