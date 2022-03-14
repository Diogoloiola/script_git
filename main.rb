require_relative './lib/tree/tree_avl'
require_relative './lib/git/git'

def messages
  puts '================= Welcome ================'
  puts '1 - Analyze repository locally'
  puts '2 - Analyze repository remote'
end

def main
  messages
  choice = gets.chomp.to_i
  if choice == 1
    puts 'Enter the project path'
    path = gets.chomp
    Git.new(path, AVLTree.new).print_all_contribuitores
  else
    puts 'In development'
  end
end

main
