FactoryBot.define do
  factory :sub_todo_item do
    id { 1 }
    title { 'create a mtg handout' }
    state { '1' }
    deadline { 7.days.after }
    association :todo_item
  end
end
