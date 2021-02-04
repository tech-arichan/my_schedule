require 'rails_helper'

RSpec.describe "メモ機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  
  context "メモに成功したとき" do
    it "メモの登録に成功すると、メモ一覧に表示される" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン
      add_memo(@memo) #memo追加
    end
  end
  
  context "メモ投稿に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      sign_in(@user) #ログイン
      visit memos_path
      expect(page).to have_content('新規メモ') #確認
      visit new_memo_path #移動
      expect(current_path).to eq new_memo_path #確認
      expect {
        find('input[name="commit"]').click
      }.not_to change { Event.count }
      expect(current_path).to eq new_memo_path #確認
    end
  end
end

RSpec.describe "メモ削除機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @memo = FactoryBot.build(:event)
  end

  context "メモ削除ができるとき" do
    it "メモ削除ができる" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン
      add_memo(@memo) #memo追加
      expect(page).to have_content('削除')
      expect {
        click_on("削除")
      }.to change { Memo.count }.by(-1) #memo削除
      expect(page).to have_no_content(@memo.memo) #表示確認
    end
  end
end
