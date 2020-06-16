# TVShows
Get the list of TV shows aired in United States for the week

This exciting app gets the its feed from http://www.tvmaze.com/api

Architecture:

I have used MVVM archicture keeping modularization and scaling in mind and following SOLID principle. VM binding with its view is done using generic Observable called Box

I have also used a factory pattern (ViewControllerFactory) to have easy access to all viewcontroller at one place. so that viewcontrollers can be used/reused without worrying about underlying details

Its a universal app which contains Master-Detail Design pattern for iPad and supports Potrait mode only for iPhone keeping in mind best user experience.

you can view schedule for each day by swiping left or right(have used UIPageViewController)
navigation from master to detail uses delegate pattern.
I have done all my view in code, so no xib or storyboard. Images are loaded asynchronously on a separate thread for lazy loading and smooth scrolling.

I have a generic network layer, and the API for web calls are define in Protocol for easier mocking. I have unit tested only my view models because that's where all my business logic resides.
