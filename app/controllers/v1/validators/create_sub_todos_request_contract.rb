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
    key.failure('user_id is nil') if value.nil? || value.blank?
  end

  rule(:id) do
    key.failure('id is nil') if value.nil? || value.blank?
  end

  rule(:title) do
    key.failure('title is nil') if value.nil? || value.blank?
  end

  rule(:deadline) do
    key.failure('deadline is nil') if value.nil? || value.blank?
  end

  def get_messages
    messages.map { |message| "#{message.path} #{message.text}" }
  end
end

