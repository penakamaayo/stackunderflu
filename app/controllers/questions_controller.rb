class QuestionsController < ApplicationController
  def index
    @question = Questions.all
  end

  def new
    @question = Question.new
  end


  def create
    @question = Question.new(questions_params)

    if @user.save
      flash[:notice] = "Successfully created question."
      redirect_to questions_index_url
    else
      redirect_to :back, :notice => "There was a problem creating your account. Please try again."
    end
  end

  def update
  end

  def destroy
  end

  private

  def questions_params
    params.require(:questions).permit(:title,:body,:user_id)
  end
end

