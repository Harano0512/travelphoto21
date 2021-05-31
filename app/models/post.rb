class Post < ApplicationRecord
  with_options presence: true do
    validates :travel_date
    validates :prefecture_id
    validates :article
  end

  belongs_to :user
  belongs_to :content
end
