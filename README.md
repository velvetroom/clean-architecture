# Clean Architecture

![iOS](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)
![Swift](https://img.shields.io/badge/Swift-4.2-blue.svg)
[![Build Status](https://app.bitrise.io/app/04e42b095f2aed11/status.svg?token=7ZlxOD8DBPw6ho39Xb9CRw&branch=master)](https://app.bitrise.io/app/04e42b095f2aed11)

1. [Description](#description)
2. [Rationale](#rationale)
3. [Motivation](#motivation)
4. [Applicability](#applicability)
5. [Structure](#structure)
6. [Implementation](#implementation)
7. [Demo](#demo)


## Description

Clean Architecture is a Framework that will help create a separation of concerns in your application;
it is greatly inspired by Uncle Bob's _Clean Architecture_. You can find more about it at [The Clean Code Blog](http://blog.cleancoder.com)


### Framework

**Design reuse over code reuse**
- Predefines the design parameters so that the implementers can concentrate on the specifics of the application.
- Defines the overall structure, its partitioning into classes and objects, the key responsibilities thereof, how the classes and objects collaborate, and the thread of control.
- It's *not* meant to help you write less code, it's meant to help you have a unified code base design.


## Rationale

Separating the concerns of your application on different layers according to their responsibilities will enable you to embrace change and have a software structure more flexible.

Instead of creating an upfront design embrace a design that will allow your project to evolve.

Your application details (the user interface for example) should depend on your business logic and not the other way around.

Having a concise and cohesive design across your application can help boost productivity, refactoring and maintenance in general.


## Motivation

There are many ways to structure an application and if the overall architecture is not implicit from the beginning developers could end creating different structures for different features of the project; but creating a rigid architecture at the beginning could be even more harmful as after a while the project might look a bit different to what the developers originally had in mind.

Even worse, hoping to be able to create an upfront design that will suffice the project at the beginning and will last forever has been proved to be rather complicated and even leading projects to their doom.

Deciding what architecture you should implement in your project is difficult at the beginning, because most of the time the project evolves with the code itself and before starting to code there is little information on the inner workings of the application hence little is known of how it should be designed.

Deciding for very complex and rigid architecture since the beginning could lead your project to a dooming failure; the more complex the architecture the more difficult to implement and even the slightest change requires a big effort creating boiler plate like protocols and delegates that are little meaningful for a small project.

On the other hand, deciding for a very basic or no architecture at all could be useful at the beginning but once the project starts to grow the structure will reach its limit and wear off.

This lead us to the big question: What could be a good architecture than can be used for a small project but will also support it growing to big and complex one?

While having different architectures in an application doesn't harm directly the functionality in itself it can definitely harm the maintenance and make it difficult to refactor or allow changes in general.


- Without architecture your code has no structure.
- Without experience on the project you don't know what architecture to implement.
- Without refactoring the code starts to rot and decay.
- Without changes you cannot implement new features or modify existing ones.


## Applicability

Any application written in Swift targeting iOS 9 or higher.

It doesn't matter if your application consists of just one screen or several dozens. Clean Architecture is perfect for big and modularized projects, but it's boiler plate foot print is so low than even the simplest application can benefit from implementing it.

Ideally for new projects, but it is also possible to implement it in an existing application by an in-depth refactoring.

Monolithic and modularized projects can benefit from Clean Architecture.


## Structure

Clean Architecture follows the [Dependency Inversion Principle](https://cleancoders.com/episode/clean-code-episode-13/show).

Lower level policies depend upon higher level policies, and higher level policies are able to communicate to lower level ones through the use of interfaces or protocols.

The highest level policy is your application domain or in other words the business logic.

The lowest level policy is your user interface, i.e. labels, buttons, images, etc.

<img src="https://raw.githubusercontent.com/velvetroom/clean-architecture/master/Design/dependencies.png" width="1000" alt="Structure" />


## Implementation

### Install

You can get Clean Architecture with **CocoaPods**.

Add to your Podfile

```
pod 'CleanArchitecture'
```

Install and download

```
> pod install
```

If you are wondering what is CocoaPods take a look at: [https://cocoapods.org](https://cocoapods.org)


### Presenter

Presenters are in charge of interpreting your application data so it can be displayed to the user.

Should depend on the business logic and know nothing specific about the View.

They communicate to the View via the ViewModel.


In a new file import Clean Architecture

```
import CleanArchitecture
```

Create a class that extends Presenter:

```
class MyPresenter:Presenter {
    
}
```

### View

View is in charge of the user interface layer.

Should know everything about Presenter, ideally only interact with it and no other layer in your application should depend on View, i.e. this is the front line to the user and the lower level of abstraction.

Applications in iOS usually consist of transitions between view controllers and most of the time there is only one of these active.

When your View is instantiated it creates instances of your Presenter and ViewModel, connects them accordingly and assigns them their responsibilities.

If your View gets released also your Presenter and ViewModel will be released.

You can abstract each View as a section or screen in your application, each View will have their own ViewModels ideally they will also have their own specific Presenter.

View inherits from UIViewController.


In a new file import Clean Architecture

```
import CleanArchitecture
```

Create a new class that inherits from View.

View is a Generic class that needs to be specialized with a Presenter.

```
class MyView:View<MyPresenter> {

}
```

- `MyPresenter` Your class extending Presenter


### ViewModel

The structure of information that will be presented to the user.

Presenter is in charge of updating the ViewModel whenever it is needed. Every ViewModel can have an observer which will be notified via a closure when the property changes; ideally this observer would be your View.

You can define anything that you need in a ViewModel from basic types like Bool or String, to more complex ones like UIColor or UIImage or even your own structures.

You can also decide if your properties are optional or not.


In a new file import Clean Architecture

```
import CleanArchitecture
```

Create a new structure.

```
struct MyViewModel {
    var userName = String()
    var buttonEnabled = false
    var buttonColor:UIColor?
    var icon:UIImage?
}
```


#### Updating the ViewModel

Your Presenter is in charge of updating the ViewModel and you can decide when to do it, it can be done on any thread as it is thread safe.

In your Presenter class

```
func newUser(name:String) {
    var viewModel = MyViewModel()
    viewModel.userName = name
    update(viewModel:viewModel)
}
```

And that's it, ViewModel will take care of updating the listener if there is any.


#### Listening for ViewModel updates

Usually you want your View to listen for ViewModel updates.

Listening to updates is thread safe, it doesn't matter if your Presenter is updating in a background thread you will always be notified on the Main thread.


In your MyView class

```
func listenToUpdates() {
    presenter.viewModel { [weak self] (viewModel:MyViewModel) in
        self?.title = viewModel.userName
    }
}
```


## Demo

Clone or download this repository, it contains a simple Demo application that will help you have a clear vision of how to implement Clean Architecture.
