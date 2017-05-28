# 30-swift-projects-in-30-days

Project 30 - Google Now App

![GoogleNow.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/30.Google%20Now/GoogleNow.gif)


What I learned:
- How to do Transition Animation for Present/Dismiss
- How to do combine animation based on [BubbleTransition](https://github.com/andreamazz/BubbleTransition)
- Draw round button, the codes are:
````
triggerButton.layer.cornerRadius = triggerButton.frame.width / 2
triggerButton.layer.masksToBounds = true
````


Project 29 - Beauty Contest

![BeautyContest.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/29.Beauty%20Contest/BeautyContest.gif)

Waht I learned
- This project is based on [Yalantis的Koloda](https://github.com/Yalantis), Koloda is a very useful UIImage Selector.
- Two ways to use lazy load in Swift:
````
lazy var firstWay = "first"
````
And
````
lazy var secondWay: String = {return "Second"}()
````
Warning: For the second way, you must define the TYPE FIRST, so the complier could check in the beginning.
  
Project 28 - SnapChat Like App

![Snap Chat Like App.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/28.SnapChatLikeApp/Snap%20Chat%20Like%20App.gif)

Waht I learned

- Usage of UIScrollView, e.g., how to forbidden bounces property, isPagingEnabled property, and contentOffset property
- How to use addChildViewController
- How to use AVCaptureSession


Project 27: Carousel Effect (跑马灯效果)

![Carousel Effect.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/27.Carousel%20Effect/Carousel%20Effect.gif)

Waht I learned

- Usage of UICollectionView, for example, to deal with padding within cells, you could adjust with minimumLineSpacingForSection
- To customize a layout, you need to realize such func:
````
        prepare()
        shouldInvalidateLayout(forBoundsChange newBounds: CGRect)
        targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) 
        layoutAttributesForElements(in rect: CGRect)
````
- Usage of Visual Effect View


Project 26 - Twitter-like Splash

![TwitterLikeSplash.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/26.TwitterLikeSplash/TwitterLikeSplash.gif)

Waht I learned

- Usage of CAAnimation
- reference of Keypath in CAAnimation
- add Key Animation Frame by using CAKeyFrameAnimation


Project 25 Custom Transition

![CustomTransition.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/25.CustomTransition/CustomTransition.gif)

Waht I learned

- We can customize animation of navigationcontroller, that is to say, to implement the func in ````UINavigationControllerDelegate````
- If we only need to focus on fromVC & toVC, we only need to implement such methods:
````
navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
````

Project 24 - Vertical Menu Transition

![Vertical Menu Transition.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/24.Vertical%20Menu%20Transition/Vertical%20Menu%20Transition.gif)

Waht I learned

- Customize naviation transition for Present/Dismiss
- Generally speaking, for target-action, we will set target to "self". But if we set target to "delegate", then the action should be set ````#selector(CustomTransitionDelegate.functionName)````
- In the transition Animation complete block, please insert following func:
````
    transitionContext.completeTransition(true)
    fromViewController?.endAppearanceTransition()
    toViewController?.endAppearanceTransition()
````


Project 23 - Side Navigation App

![SideNavigation.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/23.Side%20Navigation/SideNavigation.gif)

What I learned

- Mix Swift with Objective-C
  - New a head file, e.g., Bridge.h
  - Click Project file, then Build Setting, then Objective-C Bridge Header, set the file path in Bridge.h
  - Then import all the header files in Bridge.h
- Learned how to use [SWRevealViewController](https://github.com/John-Lluch/SWRevealViewController)


Project 22 - Basic Animations

![Basic Animations.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/22.Basic%20Animations/Basic%20Animations.gif)

Waht I learned

- For animation related to position, we can both implement by modify the origin, and by setting the transform property of UIView
- For animation related to Opacity, we can modify the alpha directly
- For animation related to Scale, set the transform property of UIView, e.g.:
````
heartView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
````
- For animation related to Color, modify the backgroundColor property
- For animation related to Rotation, set the Scale Object to transform, e.g.:
````
heartView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
````

Project 21 CoreData App

![CoreDataAppDemo.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/21.CoreDataApp/CoreDataAppDemo.gif)

Waht I learned

- In order to autogenerate some codes for you, please check UseCoreData while creating new project.
- Don't have to use Editor to generate Subclass
- [Reference](http://www.cnblogs.com/Free-Thinker/p/5944551.html)


Project 20 - Apple Watch OS App - Guess Game


![WatchApp_Guess.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/20.WatchApp%20Guess/WatchApp_Guess.gif)


Waht I learned
- Need to select Watch OS while creating the project.
- Have to use Storyboard to do the layout for apple watch, and the related file is Interface.storyboard
- Use WCSession to do the interaction between Watch and Main App
- Usecase refer too:[WatchKit Introduction: Building a Simple Guess Game](http://www.appcoda.com/watchkit-introduction-tutorial/)

Project 19 - TodayWidget


![TodayWidget.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/19.TodayWidget/TodayWidget.gif)


Waht I learned

- Create Today Widget:  "File > New > Target"，then select the iOS section's "Application Extension's __Today Extension__"
- In order to share data between widget and app, please open the "App group" function. "target -> capability -> App Group -> Open it"
- Add the group and name it, then redo this steps in Extension's target, and select the group you created just now.
- Can use UserDefault as the shared storage between Main App and Widget, but we can't use StandardUserDefaults here, only to use suitName, and the name must follow the named group, e.g.:
````
let userDefault = UserDefaults(suiteName: "group.nimoAndHisFriend.watchDemo")
````

Project 18 - Spotlight Search

![SpotlightSearch.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/18.Spotlight%20Search/SpotlightSearch.gif)

What I learned

- How to use Spotlight Search:
  - import CoreSpotlight
  - Add the object as CSSearchableItem: Create a CSSearchableItemAttributeSet, then fill it's properties, such as title, contentDescription, and thumbData
  - CSSearchableItemAttribuitSet's thumbData can be catched either by UIImageJPEGRepresentation or by UIImagePNGRepresentation(Depend on the type of photo)
  - Create CSSearchableItem Obj, then add to SearchIndex by indexSearchableItems:
````
let tmpItems = [searchItem]
CSSearchableIndex.default().indexSearchableItems(tmpItems) { (error) in
}
````     
- If you face problems in debug, please reset the simulator, or just debug with Device.
