class Content < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :from_date
    validates :return_date
  end
  
  belongs_to :user
  has_many :posts, dependent: :destroy
end
