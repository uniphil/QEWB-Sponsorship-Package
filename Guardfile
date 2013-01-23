#!/usr/bin/env python
from livereload.task import Task
from livereload.compiler import lessc, coffee

# Code
Task.add('feature/*.py')

# Templates
Task.add('feature/templates/')

# Static assets
Task.add('static/img/')
Task.add('static/js/vendor/*.js')
Task.add('static/css/vendor/*.css')

# Pre-compiled awesome
Task.add('static/css/less/style.less',
	lessc('static/css/less/style.less', 'static/css/style.css'))
Task.add('static/js/coffee/main.coffee',
	coffee('static/js/coffee/main.coffee', 'static/js/main.js'))