import Cocoa
/**
 * - Abstract: This class is needed to enable UILabel like attributes for MacOS
 * - Fixme: ⚠️️ since this class isnt even public im sure we could scope it under Label ?
 */
class VerticallyAlignedTextFieldCell: NSTextFieldCell {
   let textHeight: CGFloat
   /**
    * - Fixme: ⚠️️ write doc
    */
   init(textHeight: CGFloat, textCell string: String) {
      self.textHeight = textHeight
      super.init(textCell: string)
   }
   /**
    * - Fixme: ⚠️️ write doc
    */
   override func drawingRect(forBounds rect: NSRect) -> NSRect {
      let newRect: NSRect = .init(x: 0, y: (rect.size.height - textHeight) / 2, width: rect.size.width, height: rect.size.height)
      return super.drawingRect(forBounds: newRect)
   }
   /**
    * Boilerplate
    */
   required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
