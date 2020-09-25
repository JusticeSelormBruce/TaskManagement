 Steps to follow to get the application running;

 1.  download the zip file onto your prefered location

 2. unzip the file

 3. you can run composer update to update any dependancies  (optional)

 4. create a database  with a prefered name ( note, you have to change db name accordingly in .env) else use exixting db name

 5. you run migration to migrate tables of the application

 6. run php artisan db:seed to seed database base with data using fakaer

  7. select any user with email from users table in db with default password to login. 

  8. you can run php artisan configLclear and cacheLclear to clear any change

  