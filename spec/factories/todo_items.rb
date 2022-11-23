FactoryBot.define do
  factory :todo_item do
    title { 'create a mtg handout' }
    state { '1' }
    deadline { 7.days.after }
    association :user
  end
end
