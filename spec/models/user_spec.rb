require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '必要な情報が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it '重複したemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailには@がないと登録できない' do
      @user.email = 'aaaabbbbcccc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが全角では登録できない' do
      @user.password = 'A0B0C0'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'employee_numberが空では登録できない' do
      @user.employee_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号を入力してください")
    end
    it 'employee_numberが3文字以下では登録できない'do
      @user.employee_number = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号は4文字以上で入力してください")
    end
    it 'employee_numberが半角英数では登録できない' do
      @user.employee_number = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号は不正な値です")
    end
    it 'employee_numberが全角では登録できない' do
      @user.employee_number = '１２３４'
      @user.valid?
      expect(@user.errors.full_messages).to include("社員番号は不正な値です")
    end
  end
end
