# Yumi App Features

## App Layout

the app now consists of 3 libraries and an application

- lib/common_code: an abstract layer of shared code across multiple apps/libs
- lib/dependencies: centeralises dependencies across apps and libs
- lib/yumi_pages: dedicated for yumi-app ui pages due to a localization limitation in flutter
- app/yumi: the main app

## Features Layout

- lib/common_code:
  - core
  - extensions
  - resources
  - theme
  - util
  - shared_domain:
    - address
    - auth
    - basket
    - food:
      - calories
      - categories
      - chef
      - ingredients
      - meal
      - order
    - notification
    - profile
    - schedule
    - signalR
    - transactions
    - user
    - vehicle
    - review
    - wallet
