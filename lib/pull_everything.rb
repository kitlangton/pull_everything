require "pull_everything/version"

module PullEverything
  def run
    puts "What's your GitHub username?"
    username = gets.chomp
    puts "What's your GitHub password?"
    password = gets.chomp

    Octokit.configure do |c|
      c.login = username
      c.password = password
    end

    p Octokit.user
  end
end
