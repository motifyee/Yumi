## Backend

- **User Bank Account**

  - a user can create more than one bank account:
    - **CAUSE**: a user should have only one bank account
    - **SOLUTION**:
      - fix backend to allow only one and return only one bank account
      - OR add a bank account to any account on creation time
      - OR add a primary bank account id to the backend
      - OR show only the first bank account in the frontend (BUGGY!)
    - **NOTICE**:
      - I picked up the first bank account in the frontend (BUGGY!)

- **Profile Settings**

  - shouldn't show un-editable email in the edit form
  - pickup & pickup only are not updating

## Frontend

- **Error Handling**

  - handle asynchronous errors
  - asyncronous requests overlapping

- **Structure**

  - proper structure and workflow

- **Design**

  - proper design/UI/UX
  - RTL

- **Bloc**

  - handling on save event for TextField & TileCheckbox
  - consequetive bloc events

- **API**

  - handling errors
  - error messages

- **Localization**

  - proper localization

- **Tests**

  - logic
  - UI
  - integration
  - performance
  - security
  - accessibility
  - internationalization
  - usability

- **Analytics**

  - crash analytics
  - performance analytics
  - user analytics
  - event analytics
  - content analytics
  - conversion analytics

- **Documentation**

  - business logic documentation

## Flutter Specific

- **Context**

  - access current context of a widget
  - context propagation

- **Performance**

## Crashes

- **awesome-notifications-platformexceptionshared-preferences-not-available**
  - add the follow proguards to avoid R8 full mode code shrinking for the gson package:
    - -keep class com.google.common.reflect.TypeToken
    - -keep class \* extends com.google.common.reflect.TypeToke
  - resources: (https://stackoverflow.com/questions/78656128/awesome-notifications-platformexceptionshared-preferences-not-available)
