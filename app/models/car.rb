class Car < ApplicationRecord
  after_save :add_default_image

  has_one_attached :image
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true, length: { maximum: 55 }
  validates :model, presence: true, length: { maximum: 55 }
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :owner, presence: true
  

  validates :name, presence: true

  def icon_thumbnail
    icon.variant(resize_to_limit: [300, 300]).processed
  end

  private

  def add_default_icon
    return if icon.attached?

    icon.attach(
      io: File.open(
        Rails.root.join(
          'app/assets/images/icon.png'
        )
      ), filename: 'icon.png',
      content_type: 'image/jpg'
    )
  end
end
