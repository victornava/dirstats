#!/usr/bin/env ruby

require 'find'
require 'fileutils'

def fill_test_files
  extensions = {
    ".mp3"  => (1000..100000),
    ".m4a"  => (1000..100000),
    ".jpg"  => (1000..100000),
    ".png"  => (1000..100000),
    ".md"   => (100..1000),
    ".html" => (100..1000),
    ".rb"   => (100..1000),
    ".txt"  => (100..1000),
    ".erb"  => (100..1000),
    ".csv"  => (100..1000),
    ".log"  => (100..1000),
    ""      => (100..1000)
  }

  def fill(stuff, size)
    out = ""
    while out.size < size
      out << "Ta nah nah nah nah, Another one bytes the dust\n"
    end
    out
  end

  Find.find('test-data') do |file|
    unless File.directory?(file) || file =~ /DS_Store/
      ext = File.extname(file).downcase
      size = rand(extensions[ext])
      data = fill("dummy data", size)
      puts "Writing #{data.size} bytes to #{file}"
      File.write(file, data)
    end
  end
end

def generate_test_targets
  Dir.chdir(File.join(File.dirname(__FILE__), 'test-data'))

  # Remove anoying .DS_Store files
  Dir["*/**/.DS_Store"].each { |f| FileUtils.rm(f) }

  `dirstats home > home.txt`
  `dirstats empty > empty.txt`
  `dirstats files-only > files-only.txt`
  `dirstats symlinks-and-other-weird-stuff > symlinks-and-other-weird-stuff.txt`
  `dirstats home --output-format json > home.json`

  Dir.chdir "../"
end

tasks = {
  "fill_test_files"       => "Fills test files with random data.",
  "generate_test_targets" => "Generate test targets by running the program on each test directory."
}

if tasks.keys.include?(ARGV.first)
  self.send(ARGV.first)
else
  puts "Available tasks are:"
  tasks.each do |name, description|
    puts "  #{name.ljust(21)} #{description}"
  end
end
