require 'git'
require 'fileutils'

class Repository

  def initialize(repo_url, path)
    @path = path
    @git = Git.clone(repo_url, path)
  end

  def last_commit
    commit_list.first
  end

  def prev_commit
    commit_list[1]
  end

  def cleanup
    FileUtils.rm_rf(@path)
  end

  private
  def commit_list
    @git.log.map{|c| c.sha}
  end

end