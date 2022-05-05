# Kombuchat 
CISC4800 Live Chat App
School project that consist of 4 team members, we are using `Swift` for our user interface and Firebase for user database.

Firebase is Google's application development platform for mobile and web applications. For more information refer to this [link](https://firebase.google.com/)

## Problems Encountered
**Git was not working after updating macOS**

`xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun`

-The problem is that Xcode Command-line Tools needs to be updated.

Go back to your terminal and enter:

`xcode-select --install`

and a software is going to be installed, once that is done, your git should be ready to run.

if that doesn't work, refer to this [thread](https://stackoverflow.com/questions/52522565/git-is-not-working-after-macos-update-xcrun-error-invalid-active-developer-pa)
****

## Versions

**Kombuchat 1.0**

It is able to register and log in with the respective email and password, it is all stored in the Firestore Database.

still developing:
chat interface, saving chat

**Kombuchat 1.1**

not released yet, stay tuned tho
