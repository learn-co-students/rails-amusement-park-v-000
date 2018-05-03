class ChangeColumnToPasswordDigestFromPassword < ActiveRecord::Migration[5.2]
  change_table :users do |t|
    t.change :password_digest, :string
  end
end
