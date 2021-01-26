require 'rails_helper'

RSpec.describe "タスク機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "タスク登録に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user)
      visit tasks_path
      expect(current_path).to eq tasks_path #確認
      visit new_task_path
      expect(current_path).to eq new_task_path #確認

      expect {
        find('input[name="commit"]').click
      }.not_to change { Task.count }
      expect(current_path).to eq new_task_path #確認
    end
  end

  context "タスク登録に成功したとき" do
    it "タスクの登録に成功すると、タスク一覧に表示される" do
      sign_in(@user)
      visit tasks_path
      expect(current_path).to eq tasks_path #確認
      visit new_task_path
      expect(current_path).to eq new_task_path #確認

      @task = FactoryBot.build(:task)
      fill_in 'task_title', with: @task.title
      select @task.priority.name, from: 'task[priority_id]'


      expect {
        find('input[name="commit"]').click
      }.to change { Task.count }.by(1)
      expect(current_path).to eq tasks_path#TOPにいるかの確認
      expect(page).to have_content(@task.title) #保存されたデータが表示されてるか確認
      expect(page).to have_content(@task.priority.name) #保存されたデータが表示されてるか確認

    end
  end
end
