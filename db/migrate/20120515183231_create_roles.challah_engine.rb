# This migration comes from challah_engine (originally 20120127150434)
class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string      :name
      t.text        :description
      t.string      :default_path, :default => '/'
      t.boolean     :locked, :default => false
      t.timestamps
    end
  end

  def down
    drop_table :roles
  end
end