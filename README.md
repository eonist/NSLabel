# NSLabel

- Supports center-aligned text
- Same functionality as UILabel
- Supports AutoLayout

### Examples:
```swift
let label = NSLabel(frame: .init(x: 0, y: 0, width: 120, height: 24))
label.textColor = NSColor.black
label.textAlignment = .center
label.text = "Hello world"
self.addSubview(label)
```
