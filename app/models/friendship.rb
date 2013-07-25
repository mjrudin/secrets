class Friendship < ActiveRecord::Base
  attr_accessible :follower_id, :friend_id

  belongs_to :friend, class_name: "User"
  belongs_to :follower, class_name: "User"
end
