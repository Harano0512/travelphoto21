class Post < ApplicationRecord
  with_options presence: true do
    validates :travel_date
    validates :prefecture_id, numericality:{other_than: 1}
    validates :article
    validates :images
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :user
  belongs_to :content
  has_many_attached :images
  has_many :comments
end
