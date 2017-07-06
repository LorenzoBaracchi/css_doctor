require 'git'

class Repository

  def initialize(path)
    @path = path
    @git = Git.open(path)
  end

  def last_commit
    commit_list.first
  end

  def prev_commit
    commit_list[1]
  end

  private
  def commit_list
    @git.log.map{|c| c.sha}
  end

end