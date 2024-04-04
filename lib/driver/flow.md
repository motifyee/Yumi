## Storage

- registeration step:

  - 0: signup
  - 1: addPhone
  - 2: otp
  - 3: location
  - 4: onboarding

- signup data (email, pwd, token, ...)

## On Login

- initial checks:
  - if has a stored registeration step:
    - show registration screen
  - else if has credentials:
    - show login_screen
  - else:
    - show home_screen

## On Flow Init

- registeration:
  - get profile from server
- onboarding:

  - get profile from server
  - get rides from server
  - get schedule from server
  - get documentaion from server

  - requests should be based on progress

## Restore Registeration From Server

- either: call apis to test fulfilled steps
- or: retrieve step from an special api

## Restore Registeration From Storage

- request stored signup data (email, pwd, token, ...)
- request stored registeration step to navigate to correct step
- call apis to restore data (profile, rides, schedule, documentation, ... based on progress from storage step)

## On Flow Completion

- if has registeration_screen:
  - remove registeration_screen
- if has credentials:
  - remove credentials
- show home_screen
