class AddUsrIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :usr_id, :integer
  end
end
