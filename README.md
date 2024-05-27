# NYTimesBestSellers-SwiftUI

Displays The New York Times best seller books with SwiftUI and Combine.

# How to add your developer key
In order to not expose our sensitive data, I've created a file called Config.swift that holds my API key. This config file is added to the .gitignore file. If you accidently commit and push sensitive data to your repo, consider it compromised and generate a new API key.

## 1. Generate your API key

Visit the [NYTimes Developer portal](https://developer.nytimes.com/apis), and follow the directions to generate an API key for the Books API. 

## 2. Create the config file

```swift
import Foundation

enum Config: String {
    case apiKey = "Paste your API Key here"
}
```

# Watch the app in action

