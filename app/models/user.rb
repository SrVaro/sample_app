class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  
  before_save { self.email = email.downcase }
 
  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  validates :password, presence: true, length: { minimum: 6 }
                    
  index({ name: 1, email: 1 }, { unique: true })
  
  has_secure_password
  
  

end