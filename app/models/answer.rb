class Answer < ApplicationRecord
  belongs_to :forms_response
  belongs_to :question
end
