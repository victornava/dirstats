#!/usr/bin/env ruby

require 'minitest/spec'
require 'minitest/autorun'
require 'fileutils'

Dir.chdir(File.join(File.dirname(__FILE__), 'test-data'))

# Remove anoying .DS_Store files
Dir["*/**/.DS_Store"].each { |f| FileUtils.rm(f) }

describe 'Integration' do
  it 'works with empty directories' do
    Dir.mkdir('empty') unless Dir.exist?('empty')
    assert_equal File.read('empty.txt'), `../dirstats empty`
  end
  
  it 'works when directory contains empty files only' do
    assert_equal File.read('files-only.txt'), `../dirstats files-only`
  end
  
  it 'works with symlinks and other weird stuff' do
    assert_equal File.read('symlinks-and-other-weird-stuff.txt'), 
                 `../dirstats symlinks-and-other-weird-stuff`
  end
  
  it 'can eat the whole enchilada' do
    assert_equal File.read('home.txt'), `../dirstats home`
  end
  
  it 'outputs json' do
    assert_equal File.read('home.json'), `../dirstats home --output-format json`
  end
end
