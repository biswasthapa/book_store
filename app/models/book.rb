class Book < ActiveRecord::Base
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::TextHelper
  attr_reader :book_image_url, :author_name, :publisher_name, :category_name, :card_description, :add_to_cart_image
  belongs_to :author
  belongs_to :category
  belongs_to :publisher

  validates_presence_of :title, :author_id, :category_id, :publisher_id

  has_attached_file :book_image,
    styles: {medium: '655x300', thumb: 'x150>'}

  validates_attachment_content_type :book_image, content_type: /\Aimage\/.*\z/

  def as_json(options= {})
    h = super(options)
    h[:book_image_url] = book_image_url
    h[:author_name] = author.name
    h[:publisher_name] = publisher.name
    h[:category_name] = category.name
    h[:card_description] = card_description
    h[:add_to_cart_image] = add_to_cart_image
    h
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

  private

  def book_image_url
    image_tag book_image.url
  end

  def add_to_cart_image
    image_tag '/assets/add_to_cart_small.png'
  end

  def card_description
    if description.length > 200
      truncate(description, length: 200)
    else
      description
    end
  end
end
