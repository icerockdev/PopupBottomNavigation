[![GitHub license](https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg?style=flat)](http://www.apache.org/licenses/LICENSE-2.0) 

# Popup Bottom Navigation for iOS

![ios-demo](https://github.com/icerockdev/PopupBottomNavigation/assets/5010169/6d3fe7ac-bd82-41e1-9993-a36bbad17582)

## Installation
### CocoaPods
```ruby
pod 'PopupBottomNavigation'
```

## Usage
```swift
let tabBarController = PopupTabBarController()

tabBarController.viewControllers = [
    ViewController().navigation(
        title: "First",
        image: UIImage(systemName: "candybarphone")!,
        tag: 0
    ),
    PopupTabController()
        .nested(
            viewControllers: [
                ViewController().navigation(
                    title: "Отзывы",
                    image: UIImage(systemName: "checkmark.message")!,
                    tag: 1
                ),
                ViewController().navigation(
                    title: "Лента",
                    image: UIImage(systemName: "text.bubble")!,
                    tag: 2
                )
            ]
        )
        .navigation(
            title: "Nested",
            image: UIImage(systemName: "candybarphone")!,
            tag: 2
        ),
    ViewController().navigation(
        title: "Third",
        image: UIImage(systemName: "candybarphone")!,
        tag: 3
    ),
    ViewController().navigation(
        title: "Four",
        image: UIImage(systemName: "candybarphone")!,
        tag: 4
    ),
    ViewController().navigation(
        title: "Five",
        image: UIImage(systemName: "candybarphone")!,
        tag: 5
    )
]
```

## Contributing
All development (both new features and bug fixes) is performed in the `develop` branch. This way `master` always contains the sources of the most recently released version. Please send PRs with bug fixes to the `develop` branch. Documentation fixes in the markdown files are an exception to this rule. They are updated directly in `master`.

The `develop` branch is pushed to `master` on release.

For more details on contributing please see the [contributing guide](CONTRIBUTING.md).

## License

    Copyright 2023 IceRock MAG Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
