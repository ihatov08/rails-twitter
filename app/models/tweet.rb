class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  has_many :favoriting_users, through: :favorites, source: :user

  validates :content, :presence => { :message => '本文は２文字以上１４０文字以内で入力してください。'}
  validates :content, :length => {
    :minimum => 2,
    :maximum => 140
  }

end
