clean-pyc:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -type d | xargs rm -rf
	rm -rf *.egg *.egg-info/
