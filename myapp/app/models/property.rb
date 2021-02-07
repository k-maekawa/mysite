class Property < ApplicationRecord
  has_many :rooms, dependent: :destroy
  geocoded_by :house_adress
  after_validation :geocode
  validates :house_name, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: true
  validates :area_name, presence: true, length: { maximum: 10 }
  validates :house_adress, presence: true, length: { minimum: 3, maximum: 30 }, uniqueness: true
  validates :house_station, presence: true, length: { maximum: 20 }
  validates :house_skill, presence: true, length: { maximum: 20 }
  validates :house_distance, presence: true, :numericality => { :only_interger => true, :greater_than => 0, :less_than => 21 }
  validates :rent, presence: true, :numericality => { :only_interger => true, :greater_than => 9999, :less_than => 500001 }
  mount_uploader :property_img, PropertyImgUploader

  private

  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address=" + self.address.gsub(" ", "") + "&key=AIzaSyB3EpjmKyyrszpNxPrdO1SM6jnYUKj4fnU")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
end
