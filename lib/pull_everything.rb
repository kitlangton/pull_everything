require "pull_everything/version"
require "octokit"

module PullEverything
  def self.run
    puts "Let's make Pull Requests for All The Things!"
    puts "----------"

    puts "What's your GitHub username?"
    username = gets.chomp
    puts "What's your GitHub password?"
    password = gets.chomp

    Octokit.configure do |c|
      c.login = username
      c.password = password
    end

    Octokit.auto_paginate = true
    forks = Octokit.repos(nil, type: 'owner')
    forks.each do |fork|
      next unless fork.fork && fork.owner.login == username
      repo = Octokit.repo(fork.full_name)
      sleep 1
      next unless repo&.parent&.owner&.login == 'vikingeducation'
      parent = repo.parent.full_name
      create_pr(parent, username)
    end
  end

  def self.create_pr(repo, username)
    begin
      Octokit.create_pull_request(repo, "master", "#{username}:master", "#{username}'s Solution'")
    rescue Octokit::UnprocessableEntity
      puts "#{repo}: PR already exists."
      return
    end
    puts "#{repo}: Created PR!"
  end
end
