require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できるとき' do
    it '必須項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '10a10a'
      @user.password_confirmation = '10a10a'
      expect(@user).to be_valid
    end
  end
end
