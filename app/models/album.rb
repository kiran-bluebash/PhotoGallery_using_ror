class Album < ApplicationRecord
    validates :title, presence: true
    has_one_attached :cover_image
    has_many_attached :images
    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "published", "title", "updated_at"]
      end
    has_many :taggings, dependent: :destroy
    has_many :tags,through: :taggings
    def self.tagged_with(name)
      Tag.find_by!(name: name).albums
    end
    def self.tag_counts
      Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end
  
    def tag_list
      tags.map(&:name).join(', ')
    end
  
    def tag_list=(names)
      self.tags = names.split(',').map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
end
