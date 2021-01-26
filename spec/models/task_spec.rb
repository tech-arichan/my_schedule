require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end
  
  describe "Taskの登録" do
    context "Taskが登録できるとき" do
      it "タイトル、締切日、優先順位が存在すれば登録できる" do
        expect(@task).to be_valid
      end
    end

    context "Taskが登録できないとき" do
      it "タイトルが空だと登録できない" do
        @task.title = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Title can't be blank")
      end
      it "締切日が空だと登録できない" do
        @task.deadline = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Deadline can't be blank")
      end
      it "優先順位が選択されていないと登録できない" do
        @task.priority_id = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Priority can't be blank")
      end
      it "userが紐づいていなければ登録できない" do
        @task.user = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("User must exist")
      end
    end
  end

end
