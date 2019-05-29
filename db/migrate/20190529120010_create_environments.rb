class CreateEnvironments < ActiveRecord::Migration[5.2]
  def change
    create_table :environments do |t|
      t.string :name
      t.string :version
      t.string :git_hub_release
      t.string :url
      t.string :db_url
      t.string :db_user

      t.timestamps
    end
  end
end
