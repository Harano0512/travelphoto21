require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント新規登録' do
    before do
      user = FactoryBot.create(:user)
      content = FactoryBot.create(:content, user_id: user.id)
      post = FactoryBot.create(:post,content_id: content.id,user_id: user.id)
      @comment = FactoryBot.build(:comment,post_id: post.id,user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@comment).to be_valid
      end
    end
  end
end
