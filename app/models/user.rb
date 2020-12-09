class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, length: {minimum: 8, allow_nil: true}
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true
            
    attr_reader :password
    
    after_initialize :ensure_session_token
    
    def self.generate_session_token
        self.session_token = SecureRandom.urlsafe.base64(16)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe.base64(16)
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token = SecureRandom.urlsafe.base64(16)
    end
    
    def password=(password)
        @password = password
        self.password_digest = BCrpyt::Password.create(password)
    end
    def is_password?(password)
        BCrpyt::Password.new(password).is_password?(self.password_digest)
    end
    
    def find_by_credentials(email, password)
        user = User.find_by(email: email)
         return nil if email == nil || !user.is_password?(password)
         user
    end
end

