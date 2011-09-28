class Album < ActiveRecord::Base
  belongs_to :user
  has_many :jtags
  has_attached_file :album, :styles => { :medium => "500x400>", :thumb => "150x150>" }
  self.per_page = 6
end
