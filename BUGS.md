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

- **Bloc**
  - handling on save event for TextField & TileCheckbox