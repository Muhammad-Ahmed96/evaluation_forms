class Form < ApplicationRecord
  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: ->(attributes){ attributes['label'].blank? }, allow_destroy: true
end
