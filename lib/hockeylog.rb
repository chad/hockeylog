require "hockeylog/version"
require 'hockeyapp'

class Hockeylog
  class App
    attr_reader :title, :platform, :versions
    def initialize(title, platform, versions)
      @title = title
      @platform = platform
      @versions = versions
    end
  end

  class Version
    attr_reader :number, :notes
    def initialize(number, notes)
      @number = number
      @notes = notes
    end
  end

  def self.init(access_token)
    HockeyApp::Config.configure do |config|
        config.token = access_token
    end
    client = HockeyApp.build_client
    Hockeylog.new(client)
  end

  def initialize(client)
    @client = client
  end

  def summaries
    apps.map do |app|
      versions = versions_for(app).map{|v| Version.new(v.version, v.notes)}
      App.new(app.title, app.platform, versions)
    end
  end

  def apps
    @apps ||= @client.get_apps
  end

  def versions_for(app)
    @versions = app.versions
  end

end
