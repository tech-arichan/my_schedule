require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe "memoの登録" do

    context "memoが登録できるとき" do
      it "memoが存在すれば登録できる" do
        expect(@memo).to be_valid
      end
    end

    context "memoが登録できないとき" do
      it "memoが空では登録できない" do
        @memo.memo = ""
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Memo can't be blank")
      end
      it "userが紐づいていなければ登録できない" do
        @memo.user = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include("User must exist")
      end
    end
    
  end
end
