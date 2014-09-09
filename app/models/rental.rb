class Rental < ActiveRecord::Base

  has_attached_file :rental_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :rental_photo, :content_type => /\Aimage\/.*\Z/

  has_many :reservations
  has_many :users, through: :reservations
end
