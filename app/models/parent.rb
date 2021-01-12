class Parent < ApplicationRecord
    has_many :children
    belongs_to :report
end
