class Recommendation < ApplicationRecord

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :feature
  
end
