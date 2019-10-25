class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :sent_recommendations, class_name: "Recommendation", foreign_key: "sender_id"
  has_many :recommendations, class_name: "Recommendation", foreign_key: "recipient_id"
  def friends
    fs = Friend.where("user1_id = ? OR user2_id = ?", id, id)
    fs.map do |f|
      if f.user1_id == id
        f.user2
      else
        f.user1
      end
    end
  end
end
