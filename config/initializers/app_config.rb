class AppConfig
  def self.load
    config_file = File.join(Rails.root, "config", "app_config.yml")

    if File.exists?(config_file)
      config = YAML.load(ERB.new(File.read(config_file)).result)["default"].merge(YAML.load(ERB.new(File.read(config_file)).result)[::Rails.env])
      config.keys.each do |key|
        cattr_accessor key
        send("#{key}=", config[key])
      end
    end
  end

  def self.method_missing(*args)
    nil
  end

end
AppConfig.load

raise "server_host variable should be initialized in your app_config.yml" if !AppConfig.respond_to?(:server_host) || AppConfig.server_host.nil?
