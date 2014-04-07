class AddDefaultApprovalOfFalseToComment < ActiveRecord::Migration
  def up
    change_column :comments, :approved, :boolean, default: false
    Comment.where(approved: nil).update_all(approved: false)
  end

  def down
    change_column :comments, :approved, :boolean, default: nil
    Comment.where(approved: false).update_all(approved: nil)
  end
end
