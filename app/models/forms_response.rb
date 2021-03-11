class FormsResponse < ApplicationRecord
  belongs_to :supervisor, class_name: 'User', foreign_key: 'supervisor_id'
  belongs_to :employee, class_name: 'User', foreign_key: 'employee_id'
  belongs_to :external_reviewer, class_name: 'User', foreign_key: 'external_reviewer_id'

  belongs_to :form

  has_many :answers
  accepts_nested_attributes_for :answers



  def build_form_answers
    self.form.questions.includes(:options).each do |question|
      self.answers.build question: question if self.answers.find_by(question_id: question.id).blank?
    end
  end
end
