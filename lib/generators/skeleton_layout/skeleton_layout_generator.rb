class SkeletonLayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, :type => :string, :default => 'application'

  # TODO: Option for haml?
  
  def create_layout
    template "index.html.erb", "app/views/layouts/#{file_name}.html.erb"
    copy_file '404.html', 'public/404.html'
    copy_file 'robots.txt', 'public/robots.txt'
    # Do these need to go in vendor/assets?
    directory 'stylesheets/', 'app/assets/stylesheets/'  
    copy_file 'images/apple-touch-icon-114x114.png', 'public/images/apple-touch-icon-114x114.png'  
    copy_file 'images/apple-touch-icon-72x72.png', 'public/images/apple-touch-icon-72x72.png'  
    copy_file 'images/apple-touch-icon.png', 'public/images/apple-touch-icon.png'  
    copy_file 'images/favicon.ico', 'public/favicon.ico'  
    copy_file 'javascripts/tabs.js', 'app/assets/javascripts/tabs.js'
  end

  private
  def file_name
    layout_name.underscore
  end
end
