class AddBookImageToBooks < ActiveRecord::Migration
  def change
    add_attachment :books, :book_image
  end
end
