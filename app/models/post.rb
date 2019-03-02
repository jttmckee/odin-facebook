class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :comments, dependent: :destroy
  validates :body, length: {minimum: 10}


  def preview (letters: 40)
    body.size > letters ? body[0...letters] + "..." : body
  end

end