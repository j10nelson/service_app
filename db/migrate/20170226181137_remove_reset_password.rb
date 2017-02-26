class RemoveResetPassword < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
    t.remove :reset_password_token
    t.remove :reset_password_token_expires_at
    t.remove :reset_password_email_sent_at
  end
  end
end
