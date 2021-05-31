class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user

  def self.questions_with_answer
    response = []
    current_object = {}
    where(private: false).each do |e|
      current_object["id"] = e.id
      current_object["question"] = e.title
      current_object["asker"] = e.user.name
      current_object["asker_id"] = e.user.id
      current_object["answers"] = []
      e.answers.each do |e|
        
        current_object["answers"] << {
          "answer" => e.body,
          "id" => e.id,
          "provider" => e.user.name,
          "provider_id" => e.user.id
        }
      end
      response << current_object
    end
    response
  end
end
