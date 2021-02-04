module AddMemoSupport
  def add_memo(memo)
    visit memos_path
    expect(page).to have_content('新規メモ') #確認
    visit new_memo_path #移動
    expect(current_path).to eq new_memo_path #確認
    @memo = FactoryBot.build(:memo)
    fill_in 'memo_memo', with: @memo.memo
    expect {
      find('input[name="commit"]').click
    }.to change { Memo.count }.by(1)
    expect(current_path).to eq memos_path #確認
    expect(page).to have_content(@memo.memo)  #表示確認
  end
end