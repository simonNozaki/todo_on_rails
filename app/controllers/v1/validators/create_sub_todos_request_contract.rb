require('dry/validation')

class V1::Validators::CreateSubTodosRequestContract < Dry::Validation::Contract
  params do
    required(:user_id).value(:string)
    required(:id).value(:string)
    required(:title).value(:string)
    required(:deadline).value(:string)
    required(:comment).value(:string)
  end

  rule(:user_id) do
    key.failure('user_id in nil') if value.nil?
  end

  rule(:id) do
    key.failure('id in nil') if value.nil?
  end

  rule(:title) do
    key.failure('title in nil') if value.nil?
  end

  rule(:deadline) do
    key.failure('deadline in nil') if value.nil?
  end

  rule(:comment) do
    key.failure('comment in nil') if value.nil?
  end

  def get_messages
    messages.map { |message| "#{message.path} #{message.text}" }
  end
end

