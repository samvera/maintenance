namespace :templates do
  task :load do
    $LOAD_PATH << File.expand_path("../lib", __FILE__)
  end
  desc "Push CODE_OF_CONDUCT.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task code_of_conduct: :load do
    require 'samvera'
    samvera = Samvera.new
    samvera.push_template!(
      template: File.expand_path("./templates/CODE_OF_CONDUCT.md"),
      filename: "CODE_OF_CONDUCT.md",
      overwrite: true
    )
  end
  desc "Push CONTRIBUTING.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task contributing: :load do
    require 'samvera'
    samvera = Samvera.new
    samvera.push_template!(
      template: File.expand_path("./templates/CONTRIBUTING.md"),
      filename: "CONTRIBUTING.md",
      overwrite: true
    )
  end
  desc "Push SUPPORT.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task support: :load do
    require 'samvera'
    samvera = Samvera.new
    samvera.push_template!(
      template: File.expand_path("./templates/SUPPORT.md"),
      filename: "SUPPORT.md",
      overwrite: true
    )
  end
end
