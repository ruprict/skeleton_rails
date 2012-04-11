class SkeletonLayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, :type => :string, :default => 'application'
  class_option :haml, :desc => "Generate HAML for layout view", :type => :boolean

  # TODO: Option for haml?
 
  # Copies the Skeleton files to their respecitve locations 
  def create_layout
    determine_style_path()
    copy_layout_template()
    copy_files_to_public()
    copy_stylesheets_to_asset_path() 
    copy_images()
    copy_javascript_to_asset_path()
  end

  private
  def file_name
    layout_name.underscore
  end

  def determine_style_path
    @style_path = 'app/assets'
    if (Rails.version =~ /^3\.0/) != nil
      # For Rails 3.1 and its assets pipeline we don't want to overwrite application.css
      @style_path = 'public'
    end
    
  end
  
  def copy_layout_template
    if options.haml?
        template "index.html.haml", "app/views/layouts/#{file_name}.html.haml"
      else
        template "index.html.erb", "app/views/layouts/#{file_name}.html.erb"
      end
  end

  def copy_files_to_public
    copy_file '404.html', 'public/404.html'
    copy_file 'robots.txt', 'public/robots.txt'
  end

  def copy_stylesheets_to_asset_path
    # Do these need to go in vendor/assets?
    directory 'stylesheets/', "#{@style_path}/stylesheets/"
  end

  def copy_javascript_to_asset_path
    copy_file 'javascripts/tabs.js', "#{@style_path}/javascripts/tabs.js"
  end

  def copy_images
    # Do these need to go in vendor/assets?
    copy_file 'images/apple-touch-icon-114x114.png', 'public/images/apple-touch-icon-114x114.png'  
    copy_file 'images/apple-touch-icon-72x72.png', 'public/images/apple-touch-icon-72x72.png'  
    copy_file 'images/apple-touch-icon.png', 'public/images/apple-touch-icon.png'  
    copy_file 'images/favicon.ico', 'public/favicon.ico'  
  end
end
