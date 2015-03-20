class Post < ActiveRecord::Base 
  has_one :user

  validates :description, length: { maximum: 255 }
  validates :content, length: { minimum: 255 }
  validates_uniqueness_of :title

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/system/posts/images/default/:style/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  default_scope  { order(:created_at => :desc) } # sort order by created_at


end
