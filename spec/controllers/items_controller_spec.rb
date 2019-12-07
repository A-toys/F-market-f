require 'rails_helper'

describe ItemsController do
  let(:user) { build(:user) } #factory_botの擬似ユーザーを使いたい為build

  describe '#index' do

    context 'log in' do
      before do
        login user
        get :index
      end

      # ログイン状態でrootページが開くかどうか
      it 'redners index' do
        expect(response).to render_template :index
      end

    end
  end
end