require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

    describe "GET questions_answers" do
        context "Get all Questions with answers" do
            it "shoud have status ok" do

                get :questions_answers
                
                expect(response).to have_http_status(:ok)
            end
        end
    end
    
end
