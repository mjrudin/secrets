class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  has_many(
    :authored_secrets,
    :class_name => "Secret",
    :foreign_key => "author_id"
  )
  has_many(
    :received_secrets,
    :class_name => "Secret",
    :foreign_key => "recipient_id"
  )

  has_many :follower_relationships, class_name: "Friendship",
            foreign_key: :follower_id

  has_many :friends, through: :follower_relationships, source: :friend

  has_many :friend_relationships, class_name: "Friendship",
            foreign_key: :friend_id

  has_many :followers, through: :friend_relationships, source: :follower

  validates :username, :password_digest, :presence => true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
