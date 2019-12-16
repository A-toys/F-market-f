require 'rails_helper'

RSpec.describe CardsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new, params: { id: 1 }
      expect(response).to render_template :new
    end
  end
end
