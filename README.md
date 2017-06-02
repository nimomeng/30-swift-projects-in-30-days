# 30-swift-projects-in-30-days

中文版：[抓住iOS的未来 - 30天学习编写30个Swift小程序](http://www.jianshu.com/p/c6ae28964ad5)

For any problem, please send me the e-mail: egeg3000@126.com.

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

What I learned
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

What I learned

- Usage of UIScrollView, e.g., how to forbidden bounces property, isPagingEnabled property, and contentOffset property
- How to use addChildViewController
- How to use AVCaptureSession


Project 27: Carousel Effect (跑马灯效果)

![Carousel Effect.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/27.Carousel%20Effect/Carousel%20Effect.gif)

What I learned

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

What I learned

- Usage of CAAnimation
- reference of Keypath in CAAnimation
- add Key Animation Frame by using CAKeyFrameAnimation


Project 25 Custom Transition

![CustomTransition.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/25.CustomTransition/CustomTransition.gif)

What I learned

- We can customize animation of navigationcontroller, that is to say, to implement the func in ````UINavigationControllerDelegate````
- If we only need to focus on fromVC & toVC, we only need to implement such methods:
````
navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
````

Project 24 - Vertical Menu Transition

![Vertical Menu Transition.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/24.Vertical%20Menu%20Transition/Vertical%20Menu%20Transition.gif)

What I learned

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

What I learned

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

What I learned

- In order to autogenerate some codes for you, please check UseCoreData while creating new project.
- Don't have to use Editor to generate Subclass
- [Reference](http://www.cnblogs.com/Free-Thinker/p/5944551.html)


Project 20 - Apple Watch OS App - Guess Game


![WatchApp_Guess.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/20.WatchApp%20Guess/WatchApp_Guess.gif)


What I learned
- Need to select Watch OS while creating the project.
- Have to use Storyboard to do the layout for apple watch, and the related file is Interface.storyboard
- Use WCSession to do the interaction between Watch and Main App
- Usecase refer too:[WatchKit Introduction: Building a Simple Guess Game](http://www.appcoda.com/watchkit-introduction-tutorial/)

Project 19 - TodayWidget


![TodayWidget.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/19.TodayWidget/TodayWidget.gif)


What I learned

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

Project 17 - 3D Touch Quick Action

![3DTouchQuickAction.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/17.3D%20Touch%20Quick%20Action/3DTouchQuickAction.gif)

- Please make sure the application can support 3D Press function:
````self.window?.traitCollection.forceTouchCapability == .available````
- There are two kinds of operation with 3D Press: By long press icon in Spring Board(destop in iOS), and by long press some certain element and have a Peek View in Application.
- For the first type, create the item with ````UIApplicationShortcutItem````, then set the application's shortcutItems property. Please remember, you can't use custom icon.
- For the second type, please add related event in the ViewController you want to:
  - implement ````UIViewControllerPreviewingDelegate````
  - register 3D Touch support : ````self.registerForPreviewing(with: self, sourceView: self.view)````
  - implement following methods:
````    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? 
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) 
````

Project 16 - LoginAnimation


![LoginAnimation.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/16.LoginAnimation/LoginAnimation.gif)


What I learned

- Bounce animation need to use ```usingSpringWithDamping````, and please pay attention to:
  - usingSpringWithDamping：the less the more exaggerate
  - initialSpringVelocity: the initial speed of animation
  - options: you can choose the animation method, such as EaseIn, EaseOut, EaseInOut...
- Reference[Doc1](http://blog.csdn.net/youshaoduo/article/details/53203211),[Doc2](http://easings.net/zh-cn)
- This kind of animation is so amazing, I like it :P



Project 15 - Tumblr Menu


![Tumblr Menu.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/15.Tumblr%20Menu/Tumblr%20Menu.gif)


What I learned

- animation + BlurEffect
- These lines of icon's appearing has a sequence, please control it by setting different delay value
- For custom button, I refered to :[Custom Button](http://blog.csdn.net/dfqin/article/details/37813591)


Project 14 - Video Splash

![VideoSplash.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/14.VideoSplash/VideoSplash.gif)

What I learned

- Create an AVPlayerViewController, then set it as the background of View
- Then autoplay with AVPlayerViewController
- Refered to a lib called ````VideoSplashViewController````


Project 13: Animation In TableViewCell


![AnimationInTableViewCell.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/13.AnimationInTableViewCell/AnimationInTableViewCell.gif)


What I learned

- Do the animation in method: ````viewWillAppear````. Then get all the cells by visibleCells of tableView, then do enumerate it and do animation
- Do animation by using ````usingSpringWithDamping````, set 0.8 to ````usingSpringWithDamping````, 0 to ````initalSpringVelocity````.


Project 12 -  Emoji Slot Machine

![Emoji Slot Machine.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/12.Emoji%20Slot%20Machine/Emoji%20Slot%20Machine.gif)


What I learned
- Use UIPicker to do this game
- In order to avoid show the edge of the UIPickerView, the first value and the last value of UIPickerView is forbidden. 
````Int(arc4random())%(emojiArray.count - 2) + 1````
- Add double click action to make sure it will trigger the 'bingo'
- I love this game. :)


Project 11 - Gradient in TableView


![GradientInTableView.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/11.Gradient%20in%20TableView/GradientInTableView.gif)


What I learned
- Use CAGradientLayer on UITableViewCell
- I suggest to use CAGradientLayer as the backgroundView of cell
- hide the useless style of UITableViewCell:
````
      table.separatorStyle = .none
      cell.selectionStyle = .none
````


Project 10 - Stretchy Header


![Stretchy Header.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/10.Stretchy%20Header/Stretchy%20Header.gif)


What I learned

- get the offset of ScrollView by implementing ````scrollViewDidScroll```` of UIScrollView
- then set Max and Min of the scale for picture
- set the transform of UIImageView to finish it:
````
bannerImgView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
````


Project 9 - Swipeable Cell

![Swipeable Cell.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/09.Swipeable%20Cell/Swipeable%20Cell.gif)

What I learned
- use ````editActionsForRowAt```` for UItableView, and set the functions as a array to the return value:````Array<UITableViewRowAction>````
- for each action please init UITableViewRowAction, and set the logic in block.
- this demo only for general usage of swipeable cell, if you want to custom the swiped button, you must customize the Cell and implement functions by UIPanGesture


Project 8 - Color Gradient

![ColorGradient.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/08.Color%20Gradient/ColorGradient.gif)

What I learned
- Use CAGradientLayer for the Gradient effect
- Color set's concept will help to make the array of color. Please pay attention hat the property is CGColor
- Changing color by scrolling is implemented by PanGestureRecognizer, and the effect and operation refered to :
[Solar](https://itunes.apple.com/ca/app/solar-weather/id542875991?mt=8)


Project 7 - Simple Photo Browser


![SimplePhotoBrowser.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/07.Simple%20Photo%20Browser/SimplePhotoBrowser.gif)

What I learned
- Set imageView on ScrollView to do Image Zoom
- Set maxZoomScale / minZoomScale
- implement viewForZooming method


Project 6 - Video Player


![Video Player.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/06.Video%20Player/Video%20Player.gif)


What I learned

- How to use AVPlayer, AVPlayerViewController and AVPlayerLayer
- How to run app in background by do configuration in plist
- Show info in Lock Screen(remoteControlReceived)
- Grammer: do...catch...
- [Reference]((http://www.jianshu.com/p/174fd2673897))


Project 5 -  Pull To Refresh

![PullToRefresh.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/05.Pull%20To%20Refresh/PullToRefresh.gif)

What I learned

- Usage of UIRefreshControll:
  message: ````attributedTitle````, action: ````UIControlEvents.valueChanged````


Project 4 - Limited Input Text Field


![Limit Input Text Field.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/04.Limit%20Input%20Text%20Field/Limit%20Input%20Text%20Field.gif)

What I learned

- limit input by capturing texting method: textViewDidChange
- By observing NSNotification.Name.UIKeyboardWillChangeFrame, we can get the pop and dismiss of system keyboard. 


Project 3 - Find My Position

![Find My Position.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/03.Find%20My%20Position/Find%20My%20Position.gif)

What I learned

- configuration of location:
in plist, please add:
        <key>NSLocationAlwaysUsageDescription</key>
        <true/>

- can use CLLocationManger to do locate
- if you face ```Domain=GEOErrorDomain Code=-8 "(null)"```, please change ````CLGeocoder```` var to global var

Project 2:  Watch Demo

![Watch's Demo.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/02.Watch'sDemo/Watch's%20Demo.gif)

What I learned
- Update cocoaPods to 1.2.0
- Learn how to use SnapKit (Quite similar with Monsary)
- Learn how to use Timer in Swift
- What I learned： guard，refer to [guard](http://www.jianshu.com/p/3a8e45af7fdd)


Project 1: Change Custom Font


![Custom Font.gif](https://github.com/nimomeng/30-swift-projects-in-30-days/blob/master/01.CustomFont/Custom%20Font.gif)


What I learned
- How to change property of font
- we could search font name in Storyboard, or following codes:
````
       func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
            }}}
````
