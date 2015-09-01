#!/usr/bin/python

from subprocess import call
import os.path
import sys

assumeyes = False

if (len(sys.argv) > 1):
  if (len(sys.argv) == 2):
    if (sys.argv[1] == "--assumeyes" or sys.argv[1] == "-a"):
      assumeyes = True
  else:
    print "Usage: setsl.py [-a|--assumeyes]"
    print "\t-a|--assumeyes: assumes 'yes' for all questions"


fileasoc = [
  ["vimrc", "~/.vimrc"],
  ["bashrc", "~/.bashrc"]
]

yes = set(['yes', 'y', 'ye', ''])
no = set(['no', 'n'])
scriptdir = os.path.dirname(os.path.realpath(__file__))

# link files!
for f in fileasoc:
  source = os.path.expanduser(f[1])
  target = os.path.join(scriptdir, f[0])
  override = True
  print "Trying to link %s to %s" % (source, target)

    # link or file already exists! ask if it should be replaced
  if (os.path.exists(source) or os.path.islink(source)):
    if (assumeyes):
      call(["rm", source])
      override = True
    else:
      choice = raw_input("File %s already exists! Override? [Y/n] " % source).lower()
      if choice in yes:
        call(["rm", source])
        override = True
      elif choice in no:
        override = False
        print "Not overriding %s! Skipping..." % source
        continue
      else:
        print "Please respond with 'yes' or 'no'! Skipping %s for now..." % source
  else:
    print "File %s not existing... doing symlink now!" % source

  if override:
    print "Linking %s to %s" % (source, target)
    call(["ln", "-s", target, source])

  print ""
