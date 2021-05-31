class WelcomeController < ApplicationController
  def index
    
  end

  def questions_answers
    render :json => Question.questions_with_answer.to_json, :status => :ok
  end
end
