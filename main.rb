require_relative 'all_paths'

app = App.new
app_initializer = AppStarter.new(app)
app_initializer.start
