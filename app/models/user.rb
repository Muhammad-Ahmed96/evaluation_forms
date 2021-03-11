class User < ApplicationRecord

  enum type: [:super_visor, :employee, :external_reviewer]
  has_many :forms_responses

  enum user_type: ['Employee','Supervisor','Admin', 'External Reviewer']
end
