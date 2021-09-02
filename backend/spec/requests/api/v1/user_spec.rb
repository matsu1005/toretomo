require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'User' do
    before(:each) do
      @user = create(:user)
    end

    it '特定ユーザー取得' do
      get "/api/v1/users/#{@user.id}"
      json = JSON.parse(response.body)
      expect(json['name']).to eq(@user.name)
    end

  end
end