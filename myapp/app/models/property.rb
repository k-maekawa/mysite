class Property < ApplicationRecord
  before_save { self.home_name = house_name.downcase, self.home_adress =home_adress.downcase }
  validates :house_name , presence: true, length: { maximum: 50 }, uniqueness: true
  validates :area_name, presence: true, length: { maximum: 10 }
  validates :house_adress, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :house_station, presence: true, length: { maximum: 20 }
  validates :house_skill, presence: true, length: { maximum: 20 }
  validates :house_distance, presence: true, :numericality => { :only_interger => true, :equal_to => 2 }
  validates :rent, presence: true, :numericality => { :only_interger => true, :greater_than => 4, :less_than => 7 }
end
