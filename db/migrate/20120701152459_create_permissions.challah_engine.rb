# This migration comes from challah_engine (originally 20120127150435)
class CreatePermissions < ActiveRecord::Migration
  def up
    create_table :permissions do |t|
      t.string      :name
      t.text        :description
      t.string      :key, :limit => 50
      t.boolean     :locked, :default => false
    end

    add_index :permissions, :key
  end

  def down
    drop_table :permissions
  end
end