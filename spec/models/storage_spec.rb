require 'rails_helper'

RSpec.describe Storage, type: :model do
  before do
    @storage = FactoryBot.build(:storage)
  end

  describe "storageの登録" do

    context "storageが登録できるとき" do
      it "タイトル、画像が存在すれば登録できる" do
        expect(@storage).to be_valid
      end
    end

    context "storageが登録できないとき" do
      it "タイトルが空では登録できない" do
        @storage.title = ""
        @storage.valid?
        expect(@storage.errors.full_messages).to include("Title can't be blank")
      end
      it "画像が空では登録できない" do
        @storage.images = nil
        @storage.valid?
        expect(@storage.errors.full_messages).to include("Images can't be blank")
      end

      it "userが紐づいていなければ登録できない" do
        @storage.user = nil
        @storage.valid?
        expect(@storage.errors.full_messages).to include("User must exist")
      end
    end
    
  end

end
