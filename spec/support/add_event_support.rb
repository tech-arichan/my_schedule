module AddEventSupport
  def add_event(event)
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
