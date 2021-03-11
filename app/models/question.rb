class Question < ApplicationRecord
  belongs_to :form
  has_many :options
  accepts_nested_attributes_for :options, reject_if: ->(attributes){ attributes['label'].blank? }, allow_destroy: true
  enum question_type: ['Text','Checkbox']
end
