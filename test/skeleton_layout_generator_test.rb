require 'test_helper'
require 'generators/skeleton_layout/skeleton_layout_generator'

class SkeletonLayoutGeneratorTest < Rails::Generators::TestCase
  destination TMP_ROOT
  setup :prepare_destination
  tests ::SkeletonLayoutGenerator
 
  def test_standard_assets_are_created
    Rails.expects(:version).returns("3.1")
    run_generator 
    assert_file "public/404.html"
    assert_file "public/robots.txt"
    assert_file "app/views/layouts/application.html.erb"
    assert_file "app/assets/javascripts/tabs.js"
    assert_file "app/assets/stylesheets/base.css"
    assert_file "app/assets/stylesheets/layout.css"
    assert_file "app/assets/stylesheets/skeleton.css"
    assert_file "public/images/apple-touch-icon-114x114.png"
    assert_file "public/images/apple-touch-icon-72x72.png"
    assert_file "public/images/apple-touch-icon.png"
    assert_file "public/favicon.ico"
  end

  def test_named_layout_is_created
    run_generator %w{skeleton}
    assert_file "app/views/layouts/skeleton.html.erb"
  end

  def test_standard_assets_no_asset_pipeline
    Rails.expects(:version).returns("3.0")
    run_generator 
    assert_file "public/javascripts/tabs.js"
    assert_file "public/stylesheets/base.css"
    assert_file "public/stylesheets/layout.css"
    assert_file "public/stylesheets/skeleton.css"
  end
  
end
