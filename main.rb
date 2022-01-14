require_relative './lib/tree/tree_avl'
require_relative './lib/git/git'

def messages
  puts '================= Bem vindo ================'
  puts '1 - Analisar o arquivo localmente'
  puts '2 - Baixar um repositório'
end

def main
  messages
  choice = gets.chomp.to_i
  if choice == 1
    puts 'Informe o caminho do projeto'
    path = gets.chomp
    Git.new(path, AVLTree.new).print_all_contribuitores
  else
    puts 'Em desenvolvimento'
  end
end

main
