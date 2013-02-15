class ApplicationController < ActionController::Base
  protect_from_forgery


  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }

    logger.debug "/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"

    # system "/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
    system "bundle exec rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end
end
