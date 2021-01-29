module SignInSupport
  def sign_in(user)
    visit  new_user_session_path
    expect(page).to have_content('Log in') #確認
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path #確認
  end
end