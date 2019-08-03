#!/usr/bin/env python3

from subprocess import call
from os.path import isfile, join
from os import listdir
import os.path
import os
import sys

assumeyes = False
runscripts = False

argiterator = iter(sys.argv)
next(argiterator)
for arg in argiterator:
  if (arg == "--assume-yes" or arg == "-a"):
    assumeyes = True
  elif (arg == "-s" or arg == "--run-scripts"):
    runscripts = True
  else:
    print ("Usage: setsl.py [-a|--assume-yes] [-s|--run-scripts]")
    print ("\t-a|--assumeyes: assumes 'yes' for all questions")
    print ("\t-s|--run-scripts: runs scripts in scripts/ folder")
    sys.exit(-1)



fileasoc = [
  ["vimrc", "~/.vimrc"],
  ["bashrc", "~/.bashrc"],
  ["inputrc", "~/.inputrc"],
  ["tmux.conf", "~/.tmux.conf"],
  ["configfiles/vimrc/includes/", "~/.vim/includes"]
]

yes = set(['yes', 'y', 'ye', ''])
no = set(['no', 'n'])
scriptdir = os.path.dirname(os.path.realpath(__file__))

# link files!
for f in fileasoc:
  # source and target are from the view of the 'ln' command
  source = os.path.expanduser(f[1])
  target = os.path.join(scriptdir, f[0])
  # make sure the target path exists
  sourcedir = source
  sourcedir = os.path.dirname(source)
  if not os.path.exists(sourcedir):
      print("Creating: '%s'" % sourcedir)
      os.makedirs(sourcedir)
  override = True
  print ("Trying to link %s to %s" % (source, target))

    # link or file already exists! ask if it should be replaced
  if (os.path.exists(source) or os.path.islink(source)):
    if (assumeyes):
      call(["rm", "-r", source])
      override = True
    else:
      choice = input("File %s already exists! Override? [Y/n] " % source).lower()
      if choice in yes:
        call(["rm", "-r", source]) # directory should also be overwritten by a link
        override = True
      elif choice in no:
        override = False
        print ("Not overriding %s! Skipping..." % source)
        continue
      else:
        print ("Please respond with 'yes' or 'no'! Skipping %s for now..." % source)
  else:
    print ("File %s not existing... doing symlink now!" % source)

  if override:
    print ("Linking %s to %s" % (source, target))
    call(["ln", "-s", target, source])

  print ("")

scriptdir = os.path.join(scriptdir, "scripts")
files = [ f for f in listdir(scriptdir) if isfile(join(scriptdir, f)) ]

for f in files:
  call([(join(scriptdir, f))])
