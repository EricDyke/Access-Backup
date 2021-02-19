# ACCESS BACKUP SCRIPT

A simple Microsoft Access backup script that will create a backup of your access project(s). Backups will only occur if the project is open and recently modified.

Backed up files will have a prepended timestamp.

This script should be set to run periodically with your task manager.

Create an `accbu_list.csv` file from the `sample_accbu_list.csv` to indicate all access projects to be backed up and their respective backup locations.