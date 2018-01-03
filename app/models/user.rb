class User #< ApplicationRecord
    include Mongoid::Document
    field :provider, type: String
    field :uid, type: String
    field :name, type: String
    field :oauth_token, type: String
    field :oauth_expires_at, type:String
    field :score, type: Integer, default: 0
    field :streak_correct, type: Integer, default: 0
    field :streak_incorrect, type: Integer, default: 0
    field :image, type: String
    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.image = auth.info.image
          user.oauth_token = auth.credentials.token
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save
        end
    end
end
