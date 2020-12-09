class Album < ApplicationRecord
    validates :name, :title, :year, :studio_performance, presence: true

    belongs_to :band,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Band


end
