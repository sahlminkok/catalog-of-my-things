require 'all_paths'

class AppStarter
  def initialize(app)
    @app = app
  end

  def start
    options = Options.new(@app)
    options.display
  end
end
