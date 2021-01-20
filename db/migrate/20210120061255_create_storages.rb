class CreateStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :storages do |t|
      t.string   :title
      t.text     :detail
      t.references :user,            null: false,  foreign_key: true
      t.timestamps
    end
  end
end
