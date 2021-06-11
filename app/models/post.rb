class Post < ApplicationRecord
  with_options presence: true do
    validates :subject
    validates :travel_date
    validates :prefecture_id, numericality:{other_than: 1,message: 'を選択してください'}
    validates :article
    validates :images
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :user
  belongs_to :content
  has_many_attached :images
  has_many :comments

  def self.search(search)
    if search != ""
      Post.where('article LIKE(?) OR subject LIKE(?)', "%#{search}%","%#{search}%")
    else
      Post.order('travel_date DESC')
    end
  end
end
