require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ニックネームが入力されていない場合' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it '都道府県が選択されていない場合' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'メールアドレスが入力されていない場合' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'パスワードが入力されていない場合' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが5文字以下の場合' do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

    end
  end
end
