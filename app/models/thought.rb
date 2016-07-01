class Thought < ActiveRecord::Base

   validates :body, presence: true
   validates :user_id, presence: true

   belongs_to :user


end
