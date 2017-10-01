---
title: Virtualenv
date: 2017-10-01
---

- [Virtualenv Reference](http://virtualenv.readthedocs.org/en/latest/virtualenv.html#usage)
- Create a new venv `virtualenv NAME`
- <i class="fa fa-apple"></i> Activate NAME `. NAME/bin/activate`
- <i class="fa fa-windows"></i> Activate NAME `NAME\scripts\activate`
- Deactivate `deactivate`


## Virtualenvwrapper

- [Virtualenvwrapper-win](https://github.com/davidmarble/virtualenvwrapper-win)
- [Reference](http://virtualenvwrapper.readthedocs.org/en/latest/command_ref.html)
- Make a new venv `mkvirtualenv ENVNAME`
- List all virtualenvs `workon` or `lsvirtualenv`
- Activate a virtualenv `workon ENVNAME`
- Deactivate virtualenv `deactivate`
- Remove virtualenv `deactivate` and then `rmvirtualenv ENVNAME`
- <i class="fa fa-windows"></i> Bind ENVNAME to project `setprojectdir <project_path>`
- <i class="fa fa-apple"></i> Bind ENVNAME to project `setvirtualenvproject [virtualenv_path project_path]`


### Virtualenvwrapper-win not finding virtualenv-script.py

- <i class="fa fa-windows"></i> Edit `C:\PythonXY\scripts\mkvirtualenv.bat` with the following changes on lines 47, 48
- <i class="fa fa-windows"></i> Line 47 `virtualenv.exe %*`
- <i class="fa fa-windows"></i> Line 48 `REM python.exe “%PYHOME%\Scripts\virtualenv-script.py” %ARGS%`
