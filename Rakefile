namespace :templates do
  desc "Push CODE_OF_CONDUCT.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task :code_of_conduct do
    require 'lib/samvera'
    samvera = Samvera.new
    samvera.push_template!(
      template: File.expand_path("./CODE_OF_CONDUCT.md"),
      filename: "CODE_OF_CONDUCT.md",
      overwite: true
    )
  end
  desc "Push CONTRIBUTING.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task :contributing do
    require 'lib/samvera'
    samvera = Samvera.new
    samvera.push_template!(
      template: File.expand_path("./CONTRIBUTING.md"),
      filename: "CONTRIBUTING.md",
      overwite: true
    )
  end
  desc "Push SUPPORT.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task :support do
    require 'lib/samvera'
    samvera = Samvera.new
    samvera.push_template!(
      template: File.expand_path("./SUPPORT.md"),
      filename: "SUPPORT.md",
      overwite: true
    )
  end
end
