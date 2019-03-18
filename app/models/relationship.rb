class Relationship
  include Mongoid::Document
  field :follower_id, type: Integer
  field :followed_id, type: Integer
end
