class Secret < ActiveRecord::Base
  attr_accessible :title, :tag_ids

  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
  has_many :secret_taggings
  has_many :tags, through: :secret_taggings, dependent: :destroy

  validates :title, :author, :recipient, :presence => true
end
