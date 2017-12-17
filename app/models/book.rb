class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  belongs_to :publisher

  has_attached_file :book_image,
    styles: {medium: '655x300#', thumb: 'x150>'}

  validates_attachment_content_type :book_image, content_type: /\Aimage\/.*\z/
end
