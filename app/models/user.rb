class User < ActiveRecord::Base

     validates :first_name, presence: true
     validates :last_name, presence: true
     validates :username, presence: true
     has_secure_password

     has_many :thoughts

     acts_as_follower
     acts_as_followable


     def full_name
      name = [self.first_name," ", self.last_name]
      name.join
    end

    # def timeline
    #   user_ids = self.following_users.pluck(:id)
    #   user_ids.push(id)
    #   Taco.where(user_id: user_ids).order("created_at DESC")
    # end


end
