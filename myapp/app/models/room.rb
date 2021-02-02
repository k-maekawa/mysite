class Room < ApplicationRecord
  belongs_to :property
  default_scope -> { order(room_number: :desc) }
  validates :property_id, presence: true
  validates :vacant_room, presence: true
  validates :room_type, presence: true
  validates :room_number, presence: true, length: { minimum: 3, maximum: 4 }
  validates :space, presence: true, numericality: { :greater_than => 2, :less_than => 100 }
  mount_uploader :room_img, RoomImgUploader
end
