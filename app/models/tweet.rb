class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  has_many :favoriting_users, through: :favorites, source: :user

  validates :content, :length => {
    :minimum => 2,
    :maximum => 140
  }

end
