require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe "eventの登録" do

    context "eventが登録できるとき" do
      it "titleとcontentが存在すれば登録できる" do
        expect(@event).to be_valid
      end
    end

    context "eventが登録できないとき" do
      it "titleが空では登録できない" do
        @event.title = ""
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      it "contentが空では登録できない" do
        @event.content = ""
        @event.valid?
        expect(@event.errors.full_messages).to include("Content can't be blank")
      end
      it "userが紐づいていなければ登録できない" do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("User must exist")
      end
    end
    
  end
end
