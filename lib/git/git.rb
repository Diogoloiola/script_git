class Git
  attr_accessor :command, :full_path, :tree

  def initialize(full_path, tree)
    @full_path = full_path
    @commnad = 'git rev-list --all --remotes --pretty --no-merges'
    @tree = tree
  end

  def print_all_contribuitores
    search_all_contribuitores
    @tree.pre_order(@tree.root)
  end

  private

  def git_log
    `cd #{@full_path} &&  #{@commnad}`
  end

  def search_all_contribuitores
    response = git_log
    response.each_line do |line|
      next unless line.include? 'Author:'

      index = line.index('<') + 1
      tree.root = tree.insert(tree.root, line[index..line.length - 3])
    end
  end
end
