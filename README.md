# Clean Architecture

![iOS](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)
![Swift](https://img.shields.io/badge/Swift-4.2-blue.svg)
[![Build Status](https://app.bitrise.io/app/04e42b095f2aed11/status.svg?token=7ZlxOD8DBPw6ho39Xb9CRw&branch=master)](https://app.bitrise.io/app/04e42b095f2aed11)

1. [Description](#Description)
2. [Rationale](#Rationale)
3. [Motivation](#Motivation)
4. [Applicability](#Applicability)
5. [Structure](#Structure)
6. [Implementation](#Implementation)
7. [Demo](#Demo)

## Description

Clean Architecture is a Framework that will enable a separation of concerns in your Application;
it is greatly inspired by Uncle Bob's Clean Architecture. You can find more about it at [The Clean Code Blog](http://blog.cleancoder.com)

### Framework

**Design reuse over code reuse**
- Predefines the design parameters so that the implementers can concentrate on the specifics of the Application.
- Defines the overall structure, its partitioning into classes and objects, the key responsibilities thereof, how the classes and objects collaborate, and the thread of control.
- Is not going to help you write less code, is going to help you have unified code and being able to refactor it more often.
- You will be able to add **Unit Tests** completely separated from the details, hopefully implementing **Test Driven Development**.

## Rationale

Separating the concerns of your Application on the different layers according to their responsibilities will enable you to embrace change and have a software structure more flexible.

Your Application details (the User Interface for example) should depend on the Business Logic and not the other way around.

Having a concise and cohesive design across your Application can help boost productivity, refactoring and maintenance in general.

Test Driven Development is not meant to help you have more tests in your software, it is meant to help you create _Testable_ and _Uncoupled_ software, with the byproduct of adding tests in the process.

Test can't ensure your Software works but they can definitely help you spot when it is NOT working.

## Motivation

Is common among developers to have the misconception that the structure of an Application should be designed before starting the development process, even more, there is a trend to consider that this structure should be designed in a way that will enable any new feature to be
added to the Application without changing the structure itself.

These misconception lead to either a pre-design stage that can last ages and will end up with an overengineered structure, hence will make changes really hard to apply or it will be a very fragile structure where any simple change can lead to many different parts of the system to break and in need of corrective refactoring.

## Implementation

### Install

You can get **CleanArchitecture** easily with **CocoaPods**.

Add to your Podfile
```
pod 'CleanArchitecture'
```
Run installation
```
> pod install
```
If you are wondering what is CocoaPods take a look at: [https://cocoapods.org](https://cocoapods.org)

### Interactor

Interactors are the higher level layer from CleanArchitecture, that is, the closer to your business level.

They should know nothing about _Presenter_ and _View_ layer.

They should depend (know everything or import) on your business layer.

In a new file import Clean Architecture

```
import CleanArchitecture
```

Create a class that implements _InteractorProtocol_ and add the required boiler plate of interactors:

```
class Interactor:InteractorProtocol {
weak var router:UINavigationController?
weak var presenter:InteractorDelegateProtocol?

required init() { }
}
```

- Router: A weak reference to the object in charge of presenting views in you Application, the Navigation Controller for example.
- Presenter: A weak reference to the _InteractorDelegateProtocol_; this is the only communication going from the Interactor to the Presenter, the Interactor notifies the Presenter when it should update the presentation.
- Required init: Initialize any property that you need or leave it empty if none.

### Presenter

Presenters are in charge of how the interpreting your Application Data so it can be presented to the user via the Views.

Should depend on _Interactor_ and know nothing specific about the _View_.

They communicate to the View via the _ViewModel_ which is a data structure containing the information the View should present.

```
import CleanArchitecture
```

Create a class that implements _PresenterProtocol_ and add the required boiler plate of presenters:

```
class Presenter:PresenterProtocol {
var viewModel:ViewModel!
var interactor:Interactor!

required init() { }
}
```





### View

View is in charge of the User Interface layer, grouping _UIViewController_, _UIView_ and derivatives from them.

In a new file import Clean Architecture

```
import CleanArchitecture
```

Create a new class that inherits from 
```
class View:CleanArchitecture.View<Presenter, ViewContent> {
```


### Architecture overview

-View

-ViewModel

-Presenter

-Interactor

-{ Business models }



### Architecture-dependencies

-ViewModel

--Just a data structure

-View

--Depends on (knows about)

---Presenter

---ViewModel

--Ignores (knows nothing about)

-Presenter

--Depends on (knows about)

---Interactor

---ViewModel

--Ignores (knows nothing about)

---View

-Interactor

--Depends on (knows about)

---{ Business models }

--Ignores (knows nothing about)

---Presenter






# Demo

Clone or download this repo, it contains a simple Demo App that will help you have a clear vision of how to adapt Clean Architecture to your project




