class Post < ApplicationRecord
  with_options presence: true do
    validates :travel_date
    validates :prefecture_id
    validates :article
    validates :image
  end

  belongs_to :user
  belongs_to :content
  has_one_attached :image
end
