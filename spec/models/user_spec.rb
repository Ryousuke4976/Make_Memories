require 'rails_helper'

RSpec.describe User, type: :model do
  context "ユーザを登録する" do
    before do
      @user = User.new
      @user.name = "ユーザ"
      @user.password = "user123"
      @user.email = "user@gmail.com"
      @user.created_at = ""
      @user.save
    end
    it "null false のみ初期データとして登録" do
      expect(@user).to be_valid
    end
  end
end
