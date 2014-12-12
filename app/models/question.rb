class Question < ActiveRecord::Base
  belongs_to :section, inverse_of: :questions
  belongs_to :type, inverse_of: :questions
  has_many :answers, inverse_of: :question
  has_many :responses, inverse_of: :question
  after_create :create_answers_if

  private
  #TODO need to add logic for optional questions and mandatory
  def create_answers_if
    if self.type.name == 'satisfaction-100'
      5.times do |n|
        Answer.create(question: self, value: (n*25).to_s + "%")
      end
    end
    if self.type.name == 'free-text'
      Answer.create(question: self, value: "textarea")
    end
  end
end
