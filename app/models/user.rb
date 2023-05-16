class User < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  has_many :books, through: :favorite_books, source: :book
  has_many :reviews, dependent: :destroy
  has_many :review_likes, dependent: :destroy
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def bookmarks(book)
    self.favorites.find_or_create_by(book_id: book.id)
  end

  def bookmarks(book)
    favorite = self.favorites.find_by(book_id: book.id)
    favorite.destroy if favorite
  end
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
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
  validate :verify_file_type

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

  private
  def verify_file_type
    return unless profile_image.attached?  # ②

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]  # ③
    errors.add(:profile_image, 'only jpg, jpeg, gif, png') unless allowed_file_types.include?(profile_image.blob.content_type)  # ④
  end

end
