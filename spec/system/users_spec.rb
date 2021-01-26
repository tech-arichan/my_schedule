require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    basic_pass root_path #ユーザー認証の通過
    expect(current_path).to eq new_user_session_path #確認
  end

  it 'ログインに成功し、トップページに遷移する' do

    visit  new_user_session_path
    expect(current_path).to eq new_user_session_path #確認
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on("Log in")
    expect(current_path).to eq root_path #確認

  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    visit root_path
    expect(current_path).to eq new_user_session_path
    fill_in 'user_email', with: "test" #誤情報
    fill_in 'user_password', with: "test" #誤情報
    click_on("Log in")
    expect(current_path).to eq new_user_session_path
  end
end
