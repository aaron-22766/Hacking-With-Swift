# Hacking With Swift

Learning Swift, SwiftUI and Xcode following the wonderful tutorials from Paul Hudson over at [hackingwithswift.com](https://www.hackingwithswift.com).

## Basics of Swift

The first 14 days provide a gentle warm up for your SwiftUI learning as we cover the fundamentals of the Swift programming language. You’ll work through a selection of tutorials every day, and there is some optional extra reading afterwards if you’d like to dig deeper. Checkpoints will challenge you to write your own solution to a problem with all the knowledge you have gathered in the previous tutorials.

- Day 1: Variables, constants, strings, and numbers
- Day 2: Booleans, string interpolation, and checkpoint 1
- Day 3: Arrays, dictionaries, sets, and enums
- Day 4: Type annotations and checkpoint 2
- Day 5: If, switch, and the ternary operator
- Day 6: Loops, summary, and checkpoint 3
- Day 7: Functions, parameters, and return values
- Day 8: Default values, throwing functions, and checkpoint 4
- Day 9: Closures, passing functions into functions, and checkpoint 5
- Day 10: Structs, computed properties, and property observers
- Day 11: Access control, static properties and methods, and checkpoint 6
- Day 12: Classes, inheritance, and checkpoint 7
- Day 13: Protocols, extensions, and checkpoint 8
- Day 14: Optionals, nil coalescing, and checkpoint 9
- Day 15: Swift Review

## Projects Overview

| Project Desctiption | Showcase |
|---------------------|----------|
| <h2>Project 1: WeSplit (Day 16-18)</h2>This project is a check-sharing app that calculates how to split a check based on the numbers of people and how much tip you want to leave. The project in itself isn’t complicated, but we’ll be taking it slow so you can see exactly how these fundamentals fit together.<br><br>**Steps and learnings:**<ul> <li>Understanding the basic structure of a SwiftUI app</li> <li>Creating a form</li> <li>Adding a navigation bar</li> <li>Modifying program state</li> <li>Binding state to user interface controls</li> <li>Creating views in a loop</li> <li>Reading text from the user with TextField</li> <li>Creating pickers in a form</li> <li>Adding a segmented control for tip percentages</li> <li>Calculating the total per person</li> <li>Hiding the keyboard</li> </ul> **Additional work:** <ul> <li>Custom percentage text field appears if chosen in segmented picker</li> </ul> | <img src="https://github.com/aaron-22766/Hacking-With-Swift/assets/79376206/5d425f81-3a10-4b51-8885-de677f92d1cc" width="150"/> |
| <h2>Challenge Day: Unit Converter (Day 19)</h2>You need to build an app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.<br><br>**Steps and Learnings:**<ul><li>Form, Picker, TextField</li></ul> **Additional work:**<ul> <li>App lets you choose which unit type to convert</li> <li>Using Unit types and Measurement for conversion</li> </ul> | <img src="https://github.com/aaron-22766/Hacking-With-Swift/assets/79376206/133ac535-5277-4d5b-9e70-8a0b85c5b8a9" width="150"/> |
| <h2>Project 2: GuessTheFlag (Day 20-22)</h2>In this second SwiftUI project we’re going to be building a guessing game that helps users learn some of the many flags of the world. This project is still going to be nice and easy, but gives me chance to introduce you to whole range of new SwiftUI functionality: stacks, buttons, images, alerts, asset catalogs, and more.<br><br>**Steps and Learnings:**<ul><li>Using stacks to arrange views</li><li>Colors and frames</li><li>Gradients</li><li>Buttons and images</li><li>Showing alert messages</li><li>Stacking up buttons</li><li>Showing the player’s score with an alert</li><li>Styling our flags</li><li>Upgrading our design</li></ul>**Additional Work:**<ul><li>Colors change with appearance</li><li>Restart button</li></ul> | <img src="https://github.com/aaron-22766/Hacking-With-Swift/assets/79376206/e859b905-ee73-4b1c-a8e8-1a7c03056505" width="150"/> |
| <h2>Project 3: ViewsAndModifiers (Day 23-24)</h2>Today is our first technique project, and we’re focusing on two fundamental components of SwiftUI: views and modifiers. We’ve been using these already, but we’ve kind of glossed over exactly how they work. Well, that ends today: we’ll be going through lots of details about what they are, how they work, and why they work as they do.<br><br>**Steps and learnings:**<ul><li>Why does SwiftUI use structs for views?</li><li>What is behind the main SwiftUI view?</li><li>Why modifier order matters</li><li>Why does SwiftUI use “some View” for its view type?</li><li>Conditional modifiers</li><li>Environment modifiers</li><li>Views as properties</li><li>View composition</li><li>Custom modifiers</li><li>Custom containers</li></ul> | *Nothing noteworthy to show today* |
| <h2>Milestone 1 & Challenge (Day 25)</h2>Today we'll review what you've learned so far, focusing on these three key points that I'll provide some better insight for:<br><ul><li>Structs vs classes</li><li>Working with ForEach</li><li>Working with bindings</li></ul>There's also a challenge for you to put that knowledge into practice. It's going to be a Rock, Paper, Scissors Guessing Game, that should work like this:<ul><li>Each turn of the game the app will randomly pick either rock, paper, or scissors.</li><li>Each turn the app will alternate between prompting the player to win or lose.</li><li>The player must then tap the correct move to win or lose the game.</li><li>If they are correct they score a point; otherwise they lose a point.</li><li>The game ends after 10 questions, at which point their score is shown.</li></ul> | <img src="https://github.com/aaron-22766/Hacking-With-Swift/assets/79376206/3c0ceb5c-b985-449c-97ae-04834fefc33e" width="150"/> | 
| <h2>Project 4: BetterRest (Day 29-31)</h2>This SwiftUI project is another forms-based app that will ask the user to enter information and convert that all into an alert. I'm going to introduce you to one of the true power features of iOS development: machine learning (ML) using Apple's CoreML.<br><br>**Steps and learnings:**<ul><li>Entering numbers with Stepper</li><li>Selecting dates and times with DatePicker</li><li>Working with dates</li><li>Training a model with Create ML</li><li>Connecting SwiftUI to Core ML</li></ul>**Additional work:**<ul><li>Coloring individual segments of a form</li><li>Dark and Light Theme</li></ul> | <img src="https://github.com/aaron-22766/Hacking-With-Swift/assets/79376206/adaffe50-b629-4fba-8a22-d7ef5067df91" width="150"/> |
| <h2>Project 5: WordScramble (Day 26-28)</h2>This project will be another game that will show players a random eight-letter word, and ask them to make words out of it. For example, if the starter word is “alarming” they might spell “alarm”, “ring”, “main”, and so on.<br><br>**Steps and learnings:**<ul><li>Introducing List, your best friend</li><li>Loading resources from your app bundle</li><li>Working with strings</li><li>Adding to a list of words</li><li>Running code when our app launches</li><li>Validating words with UITextChecker</li></ul>**Additional work:**<ul><li>✨Design✨</li><li>Scroll View direction</li><li>TextField enhancements</li><li>Change word button</li><li>Highscore system</li><li>Error in view rather that Alert</li></ul> | <img src="https://github.com/user-attachments/assets/556463c7-f888-48fe-925e-9a4d79b1a19e" width="150"/> |


*this list will be expanded as I'm currently working on the projects...*

<!--
| <h2>Project :  (Day -)</h2>DESCRIPTION<br><br>**Steps and Learnings:**BULLETS**Additional Work:**BULLETS | <img src="" width="150"/> |
-->


