class Story < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader

  def self.published_not_featured(count: nil)
    where(is_published: true, is_featured: false).order(created_at: :desc).limit(count)
  end

  def self.published(count: nil)
    where(is_published: true).order(created_at: :desc).limit(count)
  end

  def self.by_date
    order(created_at: :desc)
  end

  def self.featured
    where(is_featured: true).first || Story.by_date.first
  end
end
