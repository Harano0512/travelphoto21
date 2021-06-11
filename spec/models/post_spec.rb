require 'rails_helper'

RSpec.describe Post, type: :post do
  describe 'アルバム新規登録' do
    before do
      user = FactoryBot.create(:user)
      content = FactoryBot.create(:content, user_id: user.id)
      @post = FactoryBot.build(:post,content_id: content.id,user_id: user.id)
    end
  
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@post).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'タイトルが空では保存ができない' do
        @post.subject=""
        @post.valid?
        expect(@post.errors.full_messages).to include('タイトルを入力してください')
      end
      it '日付が空では保存ができない' do
        @post.travel_date=""
        @post.valid?
        expect(@post.errors.full_messages).to include('日付を入力してください')
      end
      it '都道府県が空では保存ができない' do
        @post.prefecture_id=""
        @post.valid?
        expect(@post.errors.full_messages).to include('都道府県を選択してください')
      end
      it '都道府県を選択しないと保存ができない' do
        @post.prefecture_id=1
        @post.valid?
        expect(@post.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'テキストが空では保存ができない' do
        @post.article=""
        @post.valid?
        expect(@post.errors.full_messages).to include('テキストを入力してください')
      end
      it '写真を選択しないと保存ができない' do
        @post.images=nil
        @post.valid?
        expect(@post.errors.full_messages).to include('写真を入力してください')
      end
    end
  
  end
end
