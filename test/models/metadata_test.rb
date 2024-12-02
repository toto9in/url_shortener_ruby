# frozen_string_literal: true

require 'test_helper'

class MetadataTest < ActiveSupport::TestCase
  test 'title attribute' do
    assert_equal 'Hello', Metadata.new('<title>Hello</title>').title
  end

  test 'missing title attribute' do
    assert_nil Metadata.new.title
  end

  test 'meta description attribute' do
    assert_equal 'Hello', Metadata.new('<meta name="description" content="Hello">').description
  end

  test 'missing meta description' do
    assert_nil Metadata.new.description
  end

  test 'image' do
    assert_equal 'https://example.org/favicon.ico', Metadata.new('<meta property="og:image" content="https://example.org/favicon.ico">').image
  end

  test 'missing og:image' do
    assert_nil Metadata.new.description
  end
end
