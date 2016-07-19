# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - This works as expected, ActiveRecord methods are available.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) There are three models: Therapist (the user), Client, and Record.  I combined several forms into one Record class, and just divided up the views. 
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) A Therapist has_many Clients.
- [x] Include user accounts.  Therapists are the user here: they can register and login to the program.
- [x] Ensure that users can't modify content created by other users. Therapists can only access their own clients; trying to view existing but unauthorized clients renders an error screen.
- [x] Include user input validations. Username, email, password, license type and license number are all validated on creation of an account.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) Depending on the error, a user lands on an error screen, a not found screen (using the Sinatra "not_found" method), or they simply can't advance to a new view. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code. Yes. 

Confirm
- [x] You have a large number of small Git commits. If I could do the project again, I would commit more frequently. 
- [x] Your commit messages are meaningful.  Yes, I can backtrack easily, based on the descriptions.
- [x] You made the changes in a commit that relate to the commit message. Yes.
- [x] You don't include changes in a commit that aren't related to the commit message.  Generally not, although there might be some exceptions.