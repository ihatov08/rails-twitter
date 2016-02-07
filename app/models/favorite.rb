class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  validate do
    unless user && user.favoritable_for?(tweet)
      errors.add(:base, :invalid)
    end
  end
end
