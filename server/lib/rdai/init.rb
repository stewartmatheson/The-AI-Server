$:.unshift File.expand_path("../lib", __FILE__)
require 'rdai/relationship'
require 'rdai/rule'
ActiveRecord::Base.send :include, RDAI::Relationship
ActiveRecord::Base.send :include, RDAI::Rule