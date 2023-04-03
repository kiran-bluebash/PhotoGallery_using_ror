class Album < ApplicationRecord
    has_one_attached :cover_image
    has_many_attached :images
    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "published", "title", "updated_at"]
      end
    
end
