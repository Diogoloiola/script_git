require_relative './lib/tree/tree_avl'
require_relative './lib/git/git'

git = Git.new('/var/www/study/github/ruby_on_rails/locallibrary', AVLTree.new)

git.print_all_contribuitores
