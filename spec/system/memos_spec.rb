require 'rails_helper'

RSpec.describe "メモ機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "メモ投稿に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user)
      visit memos_path
      expect(current_path).to eq memos_path #確認
      visit new_memo_path
      expect(current_path).to eq new_memo_path #確認

      expect {
        find('input[name="commit"]').click
      }.not_to change { Memo.count }
      expect(current_path).to eq new_memo_path #確認
    end
  end

  context "メモに成功したとき" do
    it "メモの登録に成功すると、メモ一覧に表示される" do
      sign_in(@user)
      visit memos_path
      expect(current_path).to eq memos_path #確認
      visit new_memo_path
      expect(current_path).to eq new_memo_path #確認

      @memo = FactoryBot.build(:memo)
      fill_in 'memo_memo', with: @memo.memo
      expect {
        find('input[name="commit"]').click
      }.to change { Memo.count }.by(1)
      expect(current_path).to eq memos_path#TOPにいるかの確認
      expect(page).to have_content(@memo.memo) #保存されたデータが表示されてるか確認

    end
  end
end
