
Running the Kanban Board: Please run the following line of code on bash to initiate the Kanban board:
$ cd jin_kanban<br>
$ pip3 install -r requirements.txt<br>
$ export FLASK_APP=jinkanban<br>
$ export FLASK_ENV=development<br>
$ flask initdb<br>
$ flask run<br>


Unit Tests: Please run the following line of code on bash to perform unit tests:
$ cd jin_kanban
$ python setup.py test


<Kanban Board Description>
The Kanban board supports the following main functions:

1) Allows the user to log in and log out, and the information will be automatically saved in the database (jinkanban.db). Below is the login information.

Username: jin
Password: cs162

2) Allows the user to add new items to the "To Do" list. 

3) Allows the user to freely drag and drop items between different states -- "Deleted", "Done", "Doing" and "To Do"

