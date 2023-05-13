class User < ApplicationRecord

  has_many :favorite_books
  has_many :books, through: :favorite_books, source: :book
  has_many :reviews, dependent: :destroy
  has_many :review_likes, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def favorite_books(book)
    self.favorites.find_or_create_by(book_id: book.id)
  end

  def unfavorite_books(book)
    favorite = self.favorites.find_by(book_id: book.id)
    favorite.destroy if favorite
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:user_name]

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 10 }

  enum gender: { male: 0, female: 1, no_answer:2 }


  validates :birth_date, presence: true

  def age_group
    age = Time.zone.today.year - birth_date.year
    case age
    when 10..19
      '10代'
    when 20..29
      '20代'
    when 30..39
      '30代'
    when 40..49
      '40代'
    when 50..59
      '50代'
    else
      '60代以上'
    end
  end

end
