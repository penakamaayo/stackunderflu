module ApplicationHelper
  def auto_link text
    text_arr = text.split(" ")

    result = []
    text_arr.each do |word|
      if word[0] == '@'
        username_link = convert_to_link word
        result << username_link
      else
        result << word
      end
    end
    result.join(" ")
  end


  private
    def convert_to_link username
      username.slice!(0)
      if User.where(:username => username).first
        link_to "@" << username, user_path(username).html_safe
      else
        username
      end
    end
end
