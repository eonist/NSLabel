import Cocoa
/**
 * - Note: - use self.textColor to set text color
 * - Important: ⚠️️ NSTextField has unusual high resistance and hugging priority, so we need to normalize them to be able to resize window etc
 */
open class NSLabel: NSTextField {
   /**
    * - Fixme: ⚠️️ write doc
    */
   override init(frame frameRect: NSRect) {
      super.init(frame: frameRect)
      self.isBezeled = false
      self.drawsBackground = false
      self.isEditable = false
      self.isSelectable = false
   }
   /**
    * Boilerplate
    */
   public required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Core
 */
extension NSLabel {
   /**
    * Sets the alignment of the label
    */
   open var textAlignment: NSTextAlignment {
      get { self.alignment }
      set { self.alignment = newValue }
   }
   /**
    * Sets the text of the label
    * - Note: This doesn't have to be optional, but Label.text in ios is optional so to make the call consistent we make it optional
    */
   open var text: String? {
      get { self.stringValue }
      set { self.stringValue = newValue ?? self.stringValue }
   }
   override open func hitTest(_ point: NSPoint) -> NSView? {
      isEnabled ?  super.hitTest(point) : nil
   }
   /**
    * Fixme: ⚠️️ This is not optimal, there could be a better way to do this, maybe look into: baselineOffset attributed string etc
    */
   public func centerVertically() {
      let textHeight = self.attributedStringValue.size().height
      let font = self.font
      let isBordered = self.isBordered
      let textAlignment = self.textAlignment
      let textColor = self.textColor
      let isEnabled = self.isEnabled
      self.cell = VerticallyAlignedTextFieldCell(textHeight: textHeight, textCell: self.stringValue)
      self.font = font // ⚠️️ We have to re-apply these after cell is set
      self.isBordered = isBordered
      self.textColor = textColor
      self.isEnabled = isEnabled
      self.textAlignment = textAlignment
   }
}
//   open override var cell: NSCell? {get{Swift.print("cell");return super.cell}set{super.cell = newValue}}
//   open override func drawCell(_ cell: NSCell) {
//      Swift.print("drawCell")
//      super.drawCell(cell)
//   }
//⚠️️ it could be more resonable to add nstextfield to an nsview and use the bellow
//      #if os(macOS) /*Start - vertically center, applies only for macOS*/
//      let textHeight = label.attributedStringValue.size().height
//      let y: CGFloat = (frame.size.height / 2)  - (textHeight / 2)
//      label.frame.origin.y = y
//      #endif/*End*/
