module AddStorageSupport
  def add_storage(storage)
    visit storages_path
    expect(page).to have_content('資料登録') #確認
    visit new_storage_path
    expect(current_path).to eq new_storage_path #確認
    @storage = FactoryBot.build(:storage)
    fill_in 'storage_title', with: @storage.title
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('storage[images][]', image_path, make_visible: true)
    expect {
      find('input[name="commit"]').click
    }.to change { Storage.count }.by(1)
    expect(current_path).to eq storages_path #確認
    expect(page).to have_content(@storage.title) #表示確認
  end
end