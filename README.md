See the README files in **assignee_prep2** and **carra_prep2**.  
This can be run by issuing the command  
`nohup ./runit_all.sh number_of_threads_to_use &`  
Sometimes the zip files from the USPTO with the patent information don't download correctly.
This can cause errors when running the code.
These can be avoided by commenting out the two lines  
`./get_uspto_data.sh`  
in _runit\_all.sh_ and manually downloading the files.
**example_nohup.out** is an example of what the commandline output should be on a successful run.
If there's more extensive warnings and/or errors try pulling the USPTO data again.