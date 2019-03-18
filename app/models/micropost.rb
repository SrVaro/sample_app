class Micropost
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :user_id, type: String
  field :picture, type: String
  
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  index({ user_id: 1 }, { unique: true })
  
  validates :user_id,  presence: true
  
  validates :content, presence: true, length: { maximum: 140 }

  validate  :picture_size
  
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end


end
