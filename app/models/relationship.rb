class Relationship < ApplicationRecord
    # User followes a user
    # User can be BOTH follower and followed
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"

    validates :follower_id, presence: true
    validates :followed_id, presence: true
end
