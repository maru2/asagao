class Member < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :number, :name, :full_name, :gender, :birthday, :administrator

  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?",
                        "%#{query}%",   "%#{query}%")
      end
      rel
    end
  end

  validates :number, presence: true,
    numericality: { only_integer: true,
        greater_than: 0, less_than: 100, allow_blank: true },
    uniqueness: true

  validates :name, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: true

  validates :full_name, length: { maximum: 20 }

end
