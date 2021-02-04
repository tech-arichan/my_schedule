module AddTaskSupport
  def add_task(task)
    visit tasks_path
    expect(page).to have_content('新規登録') #確認
    visit new_task_path #移動
    expect(current_path).to eq new_task_path #確認
    @task = FactoryBot.build(:task)
    fill_in 'task_title', with: @task.title
    select @task.priority.name, from: 'task[priority_id]'
    expect {
      find('input[name="commit"]').click
    }.to change { Task.count }.by(1)

    expect(page).to have_content(@task.title) #表示確認
    expect(page).to have_content(@task.priority.name) #表示確認
  end
end