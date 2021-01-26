require 'rails_helper'

RSpec.describe "画像投稿機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "画像投稿に失敗したとき" do
    it "送る値が空で登録に失敗するとき" do
      basic_pass root_path #ユーザー認証の通過
      sign_in(@user)
      visit storages_path
      expect(current_path).to eq storages_path #確認
      visit new_storage_path
      expect(current_path).to eq new_storage_path #確認

      expect {
        find('input[name="commit"]').click
      }.not_to change { Storage.count }
      expect(current_path).to eq new_storage_path #確認
    end
  end

  context "画像に成功したとき" do
    it "画像の登録に成功すると、資料一覧に表示される" do
      sign_in(@user)
      visit storages_path
      expect(current_path).to eq storages_path #確認
      visit new_storage_path
      expect(current_path).to eq new_storage_path #確認

      @storage = FactoryBot.build(:storage)
      fill_in 'storage_title', with: @storage.title

      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('storage[images][]', image_path, make_visible: true)

      expect {
        find('input[name="commit"]').click
      }.to change { Storage.count }.by(1)
      expect(current_path).to eq storages_path#TOPにいるかの確認
      expect(page).to have_content(@storage.title) #保存されたデータが表示されてるか確認

    end
  end
end
