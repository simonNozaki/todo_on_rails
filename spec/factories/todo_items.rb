FactoryBot.define do
  factory :todo_item do
    id { 1 }
    title { 'create a mtg handout' }
    state { '1' }
    deadline { 7.days.after }
    user
  end
end
