class User < ApplicationRecord

  def self.find_or_create_with_omniauth(auth)
    user = User.where(
      :provider => auth['provider'],
      :uid => auth['uid'].to_s).first
 
    unless user           
      user = create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        if auth['info']
          user.name = auth['info']['name'] || ""
        end
      end
    end
    user
  end

end
