class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre

    validates :title, :text,presence: true

    with_options numericality: { other_than: 1 } do
        validates :genre_id
    end
end
