require 'spec_helper'

describe Question do
  it "it should create question " do
    question = Question.create(question:"ror",option_a:"hi",option_b:"hi",option_c:"hi",answer:"hi",topic_id:"ror")
    expect(Question.exist?(question.id)).to be_true
  end
end