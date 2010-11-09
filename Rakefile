# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'reek/rake/task'

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end