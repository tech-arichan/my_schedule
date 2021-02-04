require 'rails_helper'

RSpec.describe "画像投稿機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "画像に成功したとき" do
    it "画像の登録に成功すると、資料一覧に表示される" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user)
      add_storage(@storage) #storage追加
    end
  end

  context "画像投稿に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      sign_in(@user)
      visit storages_path
      expect(page).to have_content('資料登録') #確認
      visit new_storage_path
      expect(current_path).to eq new_storage_path #確認
      expect {
        find('input[name="commit"]').click
      }.not_to change { Storage.count }
      expect(current_path).to eq new_storage_path #確認
    end
  end
end

RSpec.describe "資料削除機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "資料削除ができるとき" do
    it "資料削除ができる" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン
      add_storage(@storage) #storage追加

      click_on("test") #移動
      expect(page).to have_content(@storage.title) #表示確認
      expect(page).to have_content('削除')
      expect {
        click_on("削除")
      }.to change { Storage.count }.by(-1)

      expect(current_path).to eq storages_path #確認
      expect(page).to have_no_content(@storage.title) #表示確認
    end
  end
end