:: The following line is the general syntax of the robocopy command.
:: robocopy C:\Users\source_dir C:\Users\destination_dir

:: Example backup of a user profile
:: robocopy <source> <destination> *.* /XO /XJ /COPYALL /E /PURGE /R:0 /NP /W:1

:: /e recursively copies, including empty dirs.
:: /b is backup mode, copies all files including those for which you do not have permissions.

:: To Schedule a task:
:: Open 'Task Scheduler'
:: 'Create a Basic Task'
:: Open Properties for the new task
:: Check box to 'Run with the highest privileges'