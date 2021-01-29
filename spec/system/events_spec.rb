require 'rails_helper'

RSpec.describe "イベント登録機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.build(:event)
  end
  
  context "登録に成功したとき" do
    it "イベントの登録に成功すると、カレンダー登録したタイトル名が表示される" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user) #ログイン

      expect(page).to have_content('イベント追加') #確認
      visit new_event_path #移動
      expect(current_path).to eq new_event_path #確認
      fill_in 'event_title', with: @event.title
      fill_in 'event_content', with: @event.content
      expect {
        find('input[name="commit"]').click
      }.to change { Event.count }.by(1)
      expect(current_path).to eq root_path #確認
      expect(page).to have_content(@event.title) #表示確認
    end
  end
  
  context "登録に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      sign_in(@user) #ログイン

      visit root_path #移動
      expect(page).to have_content('イベント追加') #確認
      visit new_event_path #移動
      expect(current_path).to eq new_event_path #確認
      expect {
        find('input[name="commit"]').click
      }.not_to change { Event.count }
      expect(current_path).to eq new_event_path #確認
    end
  end
end
