restore_view
========

This is a fork of version 1.2 of the restore_view plugin by Yichao Zhou.

Description:
      This is a simple script to autosave cursor position and fold
      information using vim's mkview.  Although you can easily do this job by
      just add serveral line to {.,_}vimrc, write a script plugin can make it
      more clean and nice.  We assume you use a new enough Vim to enjoy
      these feature. Hope you love it:)

      Views will be saved when you save/write a file or EXIT VIM.

Suggested Setting:
      Please put them in you vimrc file.
          set viewoptions=cursor,folds,slash,unix

      Set it in a plugin file looks dirty to me.  So you'd better do it your
      self.  This only keywords not in viewoptions is "options". I believe it
      does not belong to a view.  If you think you need it, feel free to
      put it in.  If you do not want views of some files to be saved, please
      set g:loaded_restore_view. The longer time you use, the bigger view
      folder you will have.  So if you use UNIX environment, you may need to
      use cron to do some clean job.

      Most of code is from wiki.
