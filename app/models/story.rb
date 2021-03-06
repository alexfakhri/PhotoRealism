class Story < ActiveRecord::Base

has_attached_file :image, styles: { medium: "500x500>", thumb: "300x300>" }, default_url: "/images/:style/test.jpg"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

geocoded_by :location
after_validation :geocode


end
