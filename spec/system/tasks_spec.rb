require 'rails_helper'

RSpec.describe "タスク機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  
  context "タスク登録に成功したとき" do
    it "タスクの登録に成功すると、タスク一覧に表示される" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン
      add_task(@task) #task追加
    end
  end
  context "タスク登録に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      sign_in(@user)
      visit tasks_path
      expect(page).to have_content('新規登録') #確認
      visit new_task_path
      expect(current_path).to eq new_task_path #確認
      expect {
        find('input[name="commit"]').click
      }.not_to change { Task.count }
      expect(current_path).to eq new_task_path #確認
    end
  end
end

RSpec.describe "イベント編集機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "タスク編集ができるとき" do
    it "タスク編集ができる" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン
      add_task(@task) #task追加

      click_on("test") #移動
      expect(page).to have_content(@task.title) #表示確認
      click_on("編集") #移動

      expect(
        find('#task_title').value
      ).to eq @task.title

      fill_in 'task_title', with: "#{@task.title}+編集したタイトル"
      expect {
        find('input[name="commit"]').click
      }.to change { Task.count }.by(0)

      expect(current_path).to eq tasks_path #確認
      expect(page).to have_content("#{@task.title}+編集したタイトル") #表示確認
    end
  end
  # ////編集は誰でもできる設定////
end

RSpec.describe "タスク削除機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "タスク削除ができるとき" do
    it "タスク削除ができる" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン
      add_task(@task) #task追加

      click_on("test") #移動
      expect(page).to have_content(@task.title) #表示確認
      expect(page).to have_content('編集')
      expect(page).to have_content('削除')
      expect {
        click_on("削除")
      }.to change { Task.count }.by(-1)

      expect(current_path).to eq tasks_path #確認
      expect(page).to have_no_content(@task.title) #表示確認
    end
  end
end