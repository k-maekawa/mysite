class Property < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :house_name , presence: true, length: { minimum:3, maximum: 50 }, uniqueness: true
  validates :area_name, presence: true, length: { maximum: 10 }
  validates :house_adress, presence: true, length: { minimum:3, maximum: 30 }, uniqueness: true
  validates :house_station, presence: true, length: { maximum: 20 }
  validates :house_skill, presence: true, length: { maximum: 20 }
  validates :house_distance, presence: true, :numericality => { :only_interger => true, :greater_than =>0 , :less_than => 21}
  validates :rent, presence: true, :numericality => { :only_interger => true, :greater_than => 9999, :less_than => 500001 }
end