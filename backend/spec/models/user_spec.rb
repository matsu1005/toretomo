require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end
  

  it 'ユーザー作成' do
    @user = FactoryBot.create(:user)
    expect(@user).to be_valid
  end

  describe 'nullチェック' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    it 'password_confirmationが空だとNG' do
      @user.password_confirmation = ''
      expect(@user.valid?).to eq(false)
    end
    
    it 'passwordとpassword_confirmationが異なる' do
      @user.password = 'password'
      @user.password_confirmation = 'password123'
      expect(@user.valid?).to eq(false)
    end
  end

  describe '文字数制限' do
    it 'nameが15文字以内だとOK' do
      @user.name = 'あいうえおかきくけこさしすせそ'
      expect(@user.valid?).to eq(true)
    end

    it 'nameが16文字以上だとNG' do
      @user.name = 'あいうえおかきくけこさしすせそた'
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが6文字以上だとOK' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user.valid?).to eq(true)
    end

    it 'passwordが5文字以下だとNG' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      expect(@user.valid?).to eq(false)
    end
  end


  describe 'ユニーク確認' do
    before do 
      @user2 = create(:user2)
    end

    it 'nameが既に存在するとNG' do
      @user.name = @user2.name
      expect(@user.valid?).to eq(false)
    end

    it 'emailが既に存在するとNG' do
      @user.email = @user2.email
      expect(@user.valid?).to eq(false)
    end
  end
end