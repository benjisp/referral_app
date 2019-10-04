class User < ApplicationRecord

  has_many :sent_recommendations, class_name: "Recommendation", foreign_key: "sender_id"
  has_many :recommendations, class_name: "Recommendation", foreign_key: "recipient_id"
  
end
