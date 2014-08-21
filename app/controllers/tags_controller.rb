class TagsController < ApplicationController
  private

  def tags_params
    params.require(:tag).permit(:tags_list)
  end
end
