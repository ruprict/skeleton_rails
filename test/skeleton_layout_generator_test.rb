require 'test_helper'
require 'generators/skeleton_layout/skeleton_layout_generator'

class SkeletonLayoutGeneratorTest < Rails::Generators::TestCase
  destination TMP_ROOT
  setup :prepare_destination
  tests ::SkeletonLayoutGenerator
 
  def test_standard_assets_are_created
    Rails.stubs(:version).returns("3.1")
    @asset_path = "app/assets"
    run_generator 
    assert_file "public/404.html"
    assert_file "public/robots.txt"
    assert_file "app/views/layouts/application.html.erb"
    assert_file "#{@asset_path}/javascripts/tabs.js"
    assert_stylesheets
    assert_images
  end

  def test_named_layout_is_created
    run_generator %w{skeleton}
    assert_file "app/views/layouts/skeleton.html.erb"
  end

  def test_standard_assets_no_asset_pipeline
    Rails.stubs(:version).returns("3.0")
    @asset_path = "public"
    run_generator 
    assert_file "app/views/layouts/application.html.erb"
    assert_file "#{@asset_path}/javascripts/tabs.js"
    assert_stylesheets
    assert_images
  end

  def test_standard_assets_with_haml
    run_generator %w{--haml}
    assert_file "app/views/layouts/application.html.haml"
  end
  
  private
  def assert_stylesheets
    assert_file "#{@asset_path}/stylesheets/base.css"
    assert_file "#{@asset_path}/stylesheets/layout.css"
    assert_file "#{@asset_path}/stylesheets/skeleton.css"
  end
  
  def assert_images
    assert_file "public/favicon.ico"
    assert_file "public/images/apple-touch-icon-114x114.png"
    assert_file "public/images/apple-touch-icon-72x72.png"
    assert_file "public/images/apple-touch-icon.png"
  end
end
