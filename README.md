# enigma
## Functionality  
##### My Score: 3/4  
- My program functions correctly in regards to ruby files as well as command line interface. Due to unforeseen circumstances, I could not attempt to implement the crack method.  

## Object Oriented Programming  
##### My Score: 4/4  
- I have used both inheritance as well as a module for this project. I broke down the shift into separate classes for each letter (A, B, C, D) into subclasses and built a main Shift class as a parent. It seemed logical to do this since the Shift class broke up the string as needed and fed it into the subclasses to shift in their own unique way. The Shift class then gathered all of the shifted characters and grouped them back together correctly. My shiftable module was used by each subclass to create their own shift values, shift alphabets, and to run the shifts.  

## Ruby Conventions and Mechanics  
##### My Score: 4/4  
- To my knowledge all classes, methods, variables, and modules are named correctly. I was consistent with naming (using 'chars' vs 'characters', naming each shift subclass, test naming, etc.) for better readability. I don't believe any methods are more than 10 lines long. I used the correct enumerables--'each' was only used to run code through an array of objects, never to create a hash or array.  

## Test Driven Development  
##### My Score: 3.5/4  
- Stubs are used in every test I believe to make testing more robust and so that test don't need to rely on functionality from other classes. The thing that kept me from a 4 was exploring more edge cases--I certainly cover some--and my test coverage was _only_ at 99.2%.  

## Version Control  
##### My Score: 3.5/4  
- I'll end up right around 170 commits, with all of my pull requests including logical chunks of functionality; they are also named and clearly documented with comments to communicate what they do. I don't believe any of my commit messages are ambiguous. I gave myself a 3.5 because I can't guarantee there are no commits that include multiple pieces of functionality, however I'm sure there are hardly any.
