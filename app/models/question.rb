class Question < ActiveRecord::Base
  belongs_to :section, inverse_of: :questions
  belongs_to :type, inverse_of: :questions
  has_many :answers, inverse_of: :question
  after_create :create_answers_if_satisfaction

  private
  def create_answers_if_satisfaction
    if self.type.name == 'satisfaction-100'
      5.times do |n|
        Answer.create(question: self, value: (n*25).to_s + "%")
      end
    end
  end
end
