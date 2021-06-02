class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :prefecture_id, numericality:{other_than: 1}
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  has_many :contents, dependent: :destroy

end
