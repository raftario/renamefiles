# Batch File Renamer

Renames all files in the directory where it is run with correct filenames.

Spaces are replaced by underscores and accented letters by unaccented ones. Special characters except `-`, `_` and `.` are removed.

Written by Raphaël Thériault based on scripts by [François-Xavier Cat](https://github.com/lazywinadmin).  and released under the [MIT Licence](./LICENCE.md).  
ps2exe was written by [Ingo Karstein](http://blog.karstein-consulting.com) and reworked by Markus Scholtes and is released under the Microsoft Public Licence.

## Usage

Put the executable in the folder where you want to rename files and run it  
OR  
Put both `run.ps1` and `renamefiles.ps1` in the folder where you want to rename files and run `run.ps1` with PowerShell

## Known issues

- Some characters can cause errors (e.g. chinese characters) because PowerShell isn't even able to access them

## ps2exe

You can run `build.ps1` to create an executable from the PowerShell file. (If you ever modify the script and want to use it as an executable you will need to.)
