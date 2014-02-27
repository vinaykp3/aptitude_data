class AddTopicIdToQuestions < ActiveRecord::Migration

  def change
    add_reference :questions, :topic, index: true
  end

end
