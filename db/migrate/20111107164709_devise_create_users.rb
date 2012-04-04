class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      #t.database_authenticatable :null => false
      #t.recoverable
      
      #t.rememberable
      t.datetime :remember_created_at
      
      #t.trackable
      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      
      t.column 'name', :string
      t.column 'email', :string
      t.column 'manybots_user_id', :string
      t.column 'manybots_avatar_url', :string
      t.column 'oauth_token', :string
      t.column 'oauth_secret', :string

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :manybots_user_id, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
