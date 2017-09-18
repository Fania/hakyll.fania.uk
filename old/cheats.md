---
title: Cheats
icon: bug
---

<article id="main">

	<header class="special container">
		<span class="icon fa-bug"></span>
		<h2><strong>Solutions</strong> Log</h2>
		<p>Inspired by Dave's wonderful <strong title="Needs swearword additions."><a href="http://www.ecoconsulting.co.uk/solutions/" target="_blank">infinite solutions log</a></strong><i class="fa fa-thumbs-o-up"></i></p>
		<p>Due to the rather <span title="#$@&%*!">embarrassing</span> nature of the issues, this is an <span title="Well, hidden*.">orphan</span> page.</p>
		<strong><a href="http://xkcd.com/979/" target="_blank">DEAR PEOPLE FROM THE FUTURE: Here's what we've figured out so far ...</a></strong>
	</header>

	<section class="wrapper style4 container">
	<div class="content">
	<section>
		<hr>
		<!-- <div class="entry">
			<h2><i class="fa fa-terminal"></i> Heading</h2>
			<ul>
				<li class="info"><a href=""></a></li>
				<li class="win"><code></code></li>
				<li class="mac"><code></code></li>
				<li class="null"><code></code></li>
			</ul>
		</div> -->

		<!-- http://www.asiteaboutnothing.net/c_haskell.html -->
		<!-- http://www.dillinger.io -->
		<!-- http://www.codecogs/latex/eqneditor.php -->

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Heroku</h2>
			<ul>
				<li class="info">Dashboard <a href="https://dashboard.heroku.com/account">Login</a></li>
				<li class="info">Install the <a href="https://toolbelt.heroku.com/">toolbelt</a></li>
				<li class="info"><a href="https://devcenter.heroku.com/articles/getting-started-with-python">Python Flask Guide</a></li>
				<li class="null">Login <code>heroku login</code> (needs authenticator code)</li>
				<li class="win">Git Push <code>git push heroku master</code> only in git bash !</li>
				<li class="null">make sure reqs.txt is called requirements.txt</li>
			</ul>
		</div>
		<div class="entry">
			<h2><i class="fa fa-terminal"></i> SASS</h2>
			<ul>
				<li class="info">Reference <a href="http://sass-lang.com/documentation/file.SASS_REFERENCE.html">SASS</a></li>
				<li class="info">How to setup <a href="http://sublimetexttips.com/how-to-add-sass-support-in-sublime-text/">Sublime</a></li>
				<li class="mac">Edit scss file and then <code>Command+B</code> to compile</li>
				<li class="null">Edit init.js file to use sass or css files; or if scripts are disabled edit individual import statements in html files</li>
			</ul>
		</div>
		<div class="entry">
			<h2><i class="fa fa-terminal"></i> NLTK WordNet</h2>
			<ul>
				<li class="info">Reference <a href="http://www.nltk.org/howto/wordnet.html">WordNet Interface for NLTK</a></li>
				<li class="null">Import wordnet <code>from nltk.corpus import wordnet as wn</code></li>
				<li class="mac">Loop through lemmas <code>for l in synset.lemmas():</code></li>
				<li class="mac">Lemma name as string <code>str(lemma.name())</code></li>
				<li class="mac">Antonyms <code>synset.lemmas()[0].antonyms()</code></li>
				<li class="null">Install NLTK 3.0.0b1 <code>pip install -Iv https://pypi.python.org/packages/source/n/nltk/nltk-3.0.0b1.tar.gz#md5=f3f67fcda9bc76f57d91811a572c36e4</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Terminal & Command Prompt</h2>
			<ul>
				<li class="win">'Shift-right-click' folder to open cmd there</li>
				<li class="mac">Use the 'Open-In-Terminal' script</li>
				<li class="mac">Show all locations of file <code>type -a NAME</code></li>
				<li class="mac">Show location of file or folder <code>which NAME</code></li>
				<li class="win">Show location of file or folder (if virtualenvwrapper-win is installed) <code>whereis &lt;NAME&gt;</code></li>
				<li class="mac">Reload terminal <code>source ~/.bash_profile</code></li>
				<li class="win">Reload cmd <code>SET PATH=%PATH%;C:\CmdShortcuts</code> (unconfirmed)</li>
				<li class="win">Open cmd as admin 'Right-click' cmd executable</li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Paths</h2>
			<ul>
				<li class="win"><code>C:\Python27;C:\Python27\Scripts;</code></li>
				<li class="mac">Set folder for virtualenvs <code>export WORKON_HOME=$HOME/.virtualenvs</code></li>
				<li class="mac">Set folder for virtualenv projects <code>export PROJECT_HOME=$HOME/Desktop/PhD_Offline/Git_code</code></li>
				<li class="mac"><code>source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh</code></li>
				<li class="mac"><code>PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"</code></li>
				<li class="mac"><code>PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/:${PYTHONPATH}"</code></li>
				<li class="mac"><code>export PATH</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Pip</h2>
			<ul>
				<li class="info">Reference <a href="https://pip.pypa.io/en/latest/user_guide.html">Pip</a></li>
				<li class="mac">Upgrade pip <code>pip install -U pip</code></li>
				<li class="win">Upgrade pip <code>python -m pip install -U pip</code></li>
				<li class="null">Install NAME <code>pip install NAME</code></li>
				<li class="null">Install NAME version 1.0.4 <code>pip install NAME==1.0.4</code></li>
				<li class="null">Install specific version <code>pip install -Iv Link-to-tar.gz</code></li>
				<li class="null">Uninstall NAME <code>pip uninstall NAME</code></li>
				<li class="null">Show installed packages <code>pip list</code></li>
				<li class="null">Show out-of-date packages <code>pip list --outdated</code></li>
				<li class="null">Upgrade NAME <code>pip install --upgrade NAME</code></li>
				<li class="null">To freeze local requirements <code>pip freeze --local > requirements.txt</code></li>
				<li class="null">To freeze requirements <code>pip freeze > requirements.txt</code></li>
				<li class="null">To install from requirements <code>pip install -r requirements.txt</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-bug"></i> Switch the /usr/bin/python link to point to current python link</h2>
			<ul>
				<li class="mac"><code>cd /usr/bin</code></li>
				<li class="mac"><code>rm -f python</code></li>
				<li class="mac"><code>ln -s /Library/Frameworks/Python.framework/Versions/Current/bin/python python</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-bug"></i> Virtualenvwrapper-win not finding virtualenv-script.py</h2>
			<ul>
				<li class="win">Edit <code>C:\PythonXY\scripts\mkvirtualenv.bat</code> with the following changes on lines 47, 48</li>
				<li class="win">Line 47 <code>virtualenv.exe %*</code></li>
				<li class="win">Line 48 <code>REM python.exe "%PYHOME%\Scripts\virtualenv-script.py" %ARGS%</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Virtualenv</h2>
			<ul>
				<li class="info">Reference <a href="http://virtualenv.readthedocs.org/en/latest/virtualenv.html#usage">Virtualenv</a></li>
				<li class="null">Create a new venv <code>virtualenv NAME</code></li>
				<li class="mac">Activate NAME <code>. NAME/bin/activate</code></li>
				<li class="win">Activate NAME <code>NAME\scripts\activate</code></li>
				<li class="null">Deactivate <code>deactivate</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Virtualenvwrapper</h2>
			<ul>
				<li class="info">Reference <a href="https://github.com/davidmarble/virtualenvwrapper-win">Virtualenvwrapper-win</a></li>
				<li class="info">Reference <a href="http://virtualenvwrapper.readthedocs.org/en/latest/command_ref.html">Virtualenvwrapper</a></li>
				<li class="null">Make a new venv <code>mkvirtualenv ENVNAME</code></li>
				<li class="null">List all virtualenvs <code>workon</code> or <code>lsvirtualenv</code></li>
				<li class="null">Activate a virtualenv <code>workon ENVNAME</code></li>
				<li class="null">Deactivate virtualenv <code>deactivate</code></li>
				<li class="null">Remove virtualenv <code>deactivate</code> and then <code>rmvirtualenv ENVNAME</code></li>
				<li class="win">Bind ENVNAME to project <code>setprojectdir &lt;project_path&gt;</code></li>
				<li class="mac">Bind ENVNAME to project <code>setvirtualenvproject [virtualenv_path project_path]</code></li>
			</ul>
		</div>

		<div class="entry">
			<h2><i class="fa fa-terminal"></i> Git</h2>
			<ul>
				<li class="info">Visual <a href="https://raw.githubusercontent.com/nerdgirl/git-cheatsheet-visual/master/gitcheatsheet.png">Git Cheatsheet</a></li>
				<li class="info">Reference <a href="http://git-scm.com/docs">Git Documentation</a></li>
				<li class="null">Create repository in folder <code>git init</code></li>
				<li class="null">Clone existing repository  <code>git clone LINK</code></li>
				<li class="null">Add any new files <code>git add .</code></li>
				<li class="null">Commit changes <code>git commit -m 'Message'</code></li>
				<li class="null">Push changes <code>git push</code></li>
				<li class="null">See log <code>git log</code></li>
				<li class="null">See changes <code>git status</code> or <code>git diff</code></li>
			</ul>
		</div>

	</section>
	</div>
	</section>
</article>
