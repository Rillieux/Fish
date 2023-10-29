# Fish
"Fish" as in "teach a man to fish ... " A study in SwiftUI+CoreData+MVVM ...

This repo illustrates one method of using MVVM + CoreData + SwiftUI at a "bare bones" level. Here we are intersted in using a protocol above the data manager and making it easy to use a mock data manager which we can inject into the SwiftUI canvas preview or use for testing. 

The example now includes @Observable in the view model for iOS 17.0. Still very basic, but none of the CoreData seems to have had to need changes. Please comment if you notice abnything amiss !
