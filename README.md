# TVShows
Get the list of TV shows aired in United States for the week

This exciting app gets the its feed from http://www.tvmaze.com/api

Architecture:

I have used MVVM architecture keeping modularization and scaling in mind and following the SOLID principle. VM binding with its view is done using generic Observable called Box

I have also used a factory pattern (ViewControllerFactory) to have easy access to all viewcontroller at one place. so that viewcontrollers can be used/reused without worrying about underlying details

It's a universal app which contains Master-Detail Design pattern for iPad and supports Potrait mode only for iPhone keeping in mind best user experience.

You can view the schedule for each day by swiping left or right(have used UIPageViewController)
navigation from master to detail using a delegate pattern.
I have done all my views in code, so no xib or storyboard. Images are loaded asynchronously on a separate thread for lazy loading and smooth scrolling.

I have a generic network layer, and the API for web calls are defined in Protocol for easier mocking. I have unit tested only my view models because that's where all my business logic resides.

iPad Potrait:

<img width="312" alt="Screen Shot 2020-06-16 at 8 02 42 AM" src="https://user-images.githubusercontent.com/2734198/84771735-e71c1d00-afa7-11ea-8a43-8293aab6b81a.png">

iPad Landscape: 

<img width="558" alt="Screen Shot 2020-06-16 at 8 06 21 AM" src="https://user-images.githubusercontent.com/2734198/84772027-585bd000-afa8-11ea-935d-c41454d7a8e5.png">

iPhone Potrait: 

![image (3)](https://user-images.githubusercontent.com/2734198/84772735-5e9e7c00-afa9-11ea-89fe-4e0ad7843135.jpg)

