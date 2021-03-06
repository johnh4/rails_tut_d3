class Micropost < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
	belongs_to :user
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

	def Micropost.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships
							 WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)						
	end

end
