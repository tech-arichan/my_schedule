require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  # before do
  #   @user = FactoryBot.create(:user)
  # end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すれば登録できる' do
      basic_pass root_path #ユーザー認証の通過
      visit new_user_registration_path
      expect(page).to have_content('Create Account') #確認
      fill_in 'Name', with: "Test"
      fill_in 'Email', with: "Test@test"
      fill_in 'Password', with: "000000"
      fill_in 'Password confirmation', with: "000000"
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq root_path
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit new_user_registration_path
      expect(page).to have_content('Create Account') #確認
      fill_in 'Name', with: ""
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      basic_pass root_path #ユーザー認証の通過
      visit  new_user_session_path
      expect(page).to have_content('Log in') #確認
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path #確認
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit  new_user_session_path
      expect(page).to have_content('Log in') #確認
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end
