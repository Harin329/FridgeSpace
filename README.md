## FridgeSpace - Hack the North 2020++

![Demo](./AppDemo.gif)

## Hack the North Finalists!!
https://devpost.com/software/fridgespace

## Inspiration
Based on the observation that most household waste is avoidable, and most people donate out of convenience, FridgeSpace is a service that reduces this waste by making it possible to donate food from the comfort of one’s own home. 

## What it does
FridgeSpace allows household users to locate and donate to donation hotspots such as food banks or shelters on an interactive map. Donations are as simple as snapping a photo with a machine vision camera that will label your food for you. The map also shows what other users around you are donating to incentivize more donations. There are also donation tips to educate users of what your community is in need of and ways to help out. 

## How we built it
We began by creating designs for our app using Figma. At the same time, we started designing the application architecture. Once the designs were complete, we implemented the client and server in parallel. On the client-side, we used SwiftUI to create an iOS app. For the Python backend, we created the API using Flask. We used SQLAlchemy as our ORM to interact with CockroachDB.

## Challenges we ran into
The biggest challenge we had to face was learning how to use SwiftUI. Although we were familiar with both Swift and React Native, we wanted to challenge ourselves to learn something new by using SwiftUI. Ultimately, this was a great decision as we were able to pick up SwiftUI and successfully complete our app.

We also ran into some issues connecting to CockroachDB and quite spent some time debugging the issue, eventually discovering that the database url provided by Cockroach Cloud was incorrect. Cockroach Cloud also went down over Saturday evening, so we had to learn how to spin up a cluster ourselves to test locally.

## Accomplishments that we’re proud of
We’re really proud of the amazing designs we created for the app. We’re also really happy that we learned so many new technologies while creating this app.

## What we learned
There were many new technologies we learned in the past 36 hours such as SwiftUI, CockroachDB, Google Cloud, and Facebook’s API. We also learned how to efficiently communicate and support each other virtually.

## What's next for FridgeSpace
Future Steps for our team include working with organizations such as food banks so they can make posts through the application itself. A logistical improvement could be partnering with Canada Post so that donation pickups and dropoffs could be more efficient and convenient for both the users and organizations.

We are hosting our API at [fridg.space](http://www.fridg.space/).
