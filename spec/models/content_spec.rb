require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'content新規登録' do
    before do
      user = FactoryBot.create(:user)
      @content = FactoryBot.build(:content, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@content).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'タイトルが入力されていない場合' do
        @content.title = ""
        @content.valid?      
        expect(@content.errors.full_messages).to include("タイトルを入力してください")
      end
      it '出発日が入力されていない場合' do
        @content.from_date = ""
        @content.valid?      
        expect(@content.errors.full_messages).to include("出発日を入力してください")
      end
      it '帰着日が入力されていない場合' do
        @content.return_date = ""
        @content.valid?      
        expect(@content.errors.full_messages).to include("帰着日を入力してください")
      end
    end
  end
end
