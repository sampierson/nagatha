Factory.define :todo_item, :class => TodoItem do |f|
  f.user {|u| u.association(:user) }
  f.description 'a description'
  f.position 1
end
