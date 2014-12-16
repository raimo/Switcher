#!/usr/bin/env ruby

require 'fox16'
require 'yaml'

include Fox

config = YAML.load_file('Switcher.txt')

application = FXApp.new(config['title'],  config['title'])
main = FXMainWindow.new(application, "Regular",  nil, nil, DECOR_ALL, 0, 0, 200, 150)
application.create()
main.show(PLACEMENT_SCREEN)
application.run()

