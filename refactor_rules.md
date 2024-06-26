# Refactor Rules

<!--
- domain
  - error => use case - repo
  - test
- component
- form
  - cubit for form state
- handle error
- test
- core utils
- theme -->

## Layers:

- core:
  - setup:
    - entry_points
    - singltons
  - util
  - extensions
  - validators
  - theme
- domain:
  - data:
    - repo
    - source
  - entities
  - use_cases
- components
- pages:
  - cubit
  - components
  - view_states
  - screens

## Code Quality

> **Reliability**: Runs as documented each time
>
> **Readability**: Code is readable, easy to understand. No spaghetti code, long lines or deep nesting
>
> **Maintainability**:
>
> **Extensibility**: Follows an architecture, Modular, compliant to code standards, low complexity, loose coupling
>
> **Debugability**
>
> **Testability**: Loosely coupled and well structured
>
> **Reusability**
>
> **Performance**

### Screens/Widgets

- Eliminate deep nesting
- Eliminate improper re-renders
- Maximum file size 200 lines
- State or Variables are only managed using Cubits, no temporary variables
- No action or code while initializing `StatlessWidgets`
- To run an action on `StatlessWidget` init use: `StatefullWrapper` or `Cubit` with `init` property
- Implement view states as per examples in all screens to avoid code nesting
- Component are reusable widgets (usually not edited as frequent)
- Handle errors in all screens
- Handle UI edge cases in all screens
- Implement responsive designs (no magic numbers)
- constant values like `strings`, `numbers`, `assets` should be defined in a central place

### Logic

- Write simple, clean and expressive lines of code
- Avoid `if` nesting
- Never use `switch` or `ternary` nesting
- Avoid long `ternaries`: extract values to `variables`
- Never use `dynamic`
- Always use custom exceptions
- Write simple functions (no handling for multiple cases, otherwise each case would be a `function` or a `class`)
- Eliminate code nesting
- reduce `for` loops as possible
- **Naming**:
  - Stick to established convensions
  - Use objective, descriptive, Intention-Revealing and concise names
  - Avoid ambiguous and misleading names
  - Try to document less known variables, tell what is going on in a short comment
  - NEVER USE TWO WAYS TO NAME AN OBJECT
  - Remove noise words: ~~`PaginationHelper`~~ => `Pagination`
  - `functions` usually are clear verbs to do a specific action
  - `variables` are short, mnemonic and meaningful nouns
  - `enums` are descriptive singular nouns: ~~`enum Signals`~~ => `enum Signal`
  - `classes` are singular descriptive nouns, avoid acronyms unless it's a convension: ~~`NewsOrders`~~ => Wrong name?!
  - in English we write: `Adjective` + `Noun`:
    - ~~`WalletRepoRemote`~~ => `WalletRemoteRepo`
    - ~~`statusWork`~~ => `workStatus`
  - but here `ing` adjectives follows the noun:
    - ~~`TrackingOrderScreen`~~ => `OrderTrackingScreen`
  - Avoid bad examples, no one can know what is going on:
    - `isDriverOrderPendingEnd` !
    - `isUpdateBasket` !
    - `PutActionButton` & `putAction`: what is what?!
    - `state`: which state?!

### Design Patterns

- **Solid**

  https://www.freecodecamp.org/news/introduction-to-solid-principles/

  - **Single Responsibility**: every class must have a single, focused responsibility, a single reason to change.
  - **Open/Closed**: components must be open for extension, but, closed for modification.
  - **Liskov Substitution**: you must be able to replace a superclass object with a subclass object without affecting the correctness of the program.
  - **Interface Segregation**: a client should not be forced to depend on methods it does not use.
  - **Dependency Inversion**: high-level modules should not depend on low-level modules. Both should depend on abstractions.

- **Behavioral**

  - **Memento**
  - **State**✅
  - **Iterator**✅
  - **Strategy**✅
  - **Chain of Responsibility**
  - **Template Method**✅
  - **Command**
  - **Mediator**
  - **Observer**
  - **Visitor**

- **Structural**

  - **Composite**
  - **Adapter**
  - **Decorator**
  - **Facade**✅
  - **Flyweight**
  - **Brdige**
  - **Proxy**

- **Creational**✅

  - **Prototype**✅
  - **Singleton**✅
  - **Factory Method**✅
  - **Abstract Factory**✅
  - **Builder**✅

- **KISS**✅

  - Keep it stupid simple

- **DRY**✅
  - Don't repeat yourself
