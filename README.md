# Enigma

## What is Enigma?
A command-line interface that mimics an Enigma cipher machine.

## Setup
Versioning:
- Ruby 2.5.3

To run the encryption algorithm:
- Clone this repo and `cd` into the repo
- In the file `message.txt`, write a string that you would like encrypted (deleting any text that currently exists in the file) - non-alphabetical characters will not be encrypted and will be reinserted in their current position
- Run `$ ruby encrypt.rb message.txt encrypted.txt` - this will create your encrypted text and generate an encryption key with the date code that will be needed for decryption
- Run `$ ruby decrypt.rb encrypted.txt decrypted.txt <your key goes here> <your date code goes here> - this will decrypt the string and print to a text file
- You can take a look at each text file to see the original message, encrypted string, and decrypted string

** This app is a final project for the 1st quarter of Turing School of Software & Design's back-end program. We were asked to self evaluate, where a 3 in a particular section represents all requirements met, and a 4 represents going above and beyond what was asked of us. I have included my evaluation if you would like to see my decision/thought process for this project.

## Functionality  
##### My Score: 3/4  
- My program functions correctly in regards to ruby files as well as command line interface.  

## Object Oriented Programming  
##### My Score: 4/4  
- I have used both inheritance as well as a module for this project. I broke down the shift into separate classes for each letter (A, B, C, D) into subclasses and built a main Shift class as a parent. It seemed logical to do this since the Shift class broke up the string as needed and fed it into the subclasses to shift in their own unique way. The Shift class then gathered all of the shifted characters and grouped them back together correctly. My shiftable module was used by each subclass to create their own shift values, shift alphabets, and to run the shifts.  

## Ruby Conventions and Mechanics  
##### My Score: 4/4  
- To my knowledge all classes, methods, variables, and modules are named correctly. I was consistent with naming (using 'chars' vs 'characters', naming each shift subclass, test naming, etc.) for better readability. I don't believe any methods are more than 10 lines long. I used the correct enumerables--`each` was only used to run code through an array of objects, never to create a hash or array.  

## Test Driven Development  
##### My Score: 3.5/4  
- Stubs are used in every test I believe to make testing more robust and so that test don't need to rely on functionality from other classes. The thing that kept me from a 4 was exploring more edge cases--I certainly cover some--and my test coverage was _only_ at 99.2%.  

## Version Control  
##### My Score: 3.5/4  
- I'll end up right around 170 commits, with all of my pull requests including logical chunks of functionality; they are also named and clearly documented with comments to communicate what they do. I don't believe any of my commit messages are ambiguous. I gave myself a 3.5 because I can't guarantee there are no commits that include multiple pieces of functionality, however I'm sure that if they exists, they are few in number.
