require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "投稿内容の保存" do
    before do
      @post = Post.new
      @post.content = "ヤッホーー！"
      @post.user_id = 1
      @post.save
    end
    it "null falseのみ保存" do
      expect(@post).to be_valid
    end
  end
end
