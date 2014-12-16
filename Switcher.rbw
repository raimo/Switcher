#!/usr/bin/env ruby

require 'fox16'
require 'yaml'

include Fox

config = YAML.load_file('Switcher.txt')

application = FXApp.new(config['title'],  config['title'])
main = FXMainWindow.new(application, config['title'],  nil, nil, DECOR_ALL, 0, 0, 0, 0)

FXButton.new(main, "Launch &Direct To Rift Executable", nil, application, FXApp::BUTTON_NORMAL, 0, 0, 0, 0, 1, 1, 1, 1).connect(SEL_COMMAND) do
	application.destroy()
	exec config['direct_to_rift_exe']
end
FXButton.new(main, "Launch &Regular Executable", nil, application, FXApp::BUTTON_NORMAL,  0, 0, 0, 0, 1, 1, 1, 1).connect(SEL_COMMAND) do
	application.destroy()
	exec config['regular_exe']
end
application.create()
main.show(PLACEMENT_SCREEN)
application.run()

