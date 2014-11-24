
import UIKit;

class LittleView2 : UIView {

	let label: UILabel = UILabel();

	override init() {
	
		super.init(frame: CGRectZero);
		autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
		backgroundColor = UIColor.blackColor();
		
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		backgroundColor = UIColor.redColor();
	
		label.backgroundColor = UIColor.clearColor();
		label.textColor = UIColor.whiteColor();
		addSubview(label);
		bringSubviewToFront(label)
	}
	
	override func layoutSubviews() {
	
	// Trying to create rectangle for animation using label and special character
	
		label.font = UIFont.systemFontOfSize(24);
		let attributes2: [NSObject: AnyObject] = [NSFontAttributeName: label.font];
		label.text = "∎";
		let textSize: CGSize = label.text!.sizeWithAttributes(attributes2);
		let screen: UIScreen = UIScreen.mainScreen();
		let applicationFrame: CGRect = screen.applicationFrame;

		label.frame = CGRectMake(
			applicationFrame.origin.x + 10,
			bounds.size.height - 10,
			textSize.width,
			textSize.height);
			}
	
	override func drawRect(rect: CGRect) {
	
		// Placing name of a song
	
		let s: String = "Just Tonight";

		let font: UIFont = UIFont.systemFontOfSize(36);
		let foregroundColor: UIColor = UIColor.whiteColor();
		let attributes: [NSObject: AnyObject] = [NSFontAttributeName: font,
		NSForegroundColorAttributeName: foregroundColor]; //a dictionary

		let screen: UIScreen = UIScreen.mainScreen();
		let applicationFrame: CGRect = screen.applicationFrame;
		let size: CGSize = s.sizeWithAttributes(attributes);
		let x: CGFloat = applicationFrame.origin.x + (bounds.size.width - size.width) / 2;
		let y: CGFloat = applicationFrame.origin.y ;
		let point: CGPoint = CGPointMake(x, y);

		
		s.drawAtPoint(point, withAttributes: attributes);
		
		// Placing album photo
		
		let w: CGFloat = bounds.size.width;
		let h: CGFloat = bounds.size.height;

		let image: UIImage? = UIImage(named: "pretty-reckless.png");
		if image == nil {
		println("could not find pretty-reckless.png");
		return;
		}


		let point2: CGPoint = CGPointMake(
		(w - image!.size.width) / 2,
		(h - image!.size.height) / 2);

		image!.drawAtPoint(point2);
		
		// Placing time line (i wish it would work with an animation)
		
		let c: CGContextRef = UIGraphicsGetCurrentContext();
		
		CGContextBeginPath(c);
		CGContextMoveToPoint(c, applicationFrame.origin.x + 10,( bounds.size.height - (bounds.size.height - image!.size.height)/4));
		CGContextAddLineToPoint(c, bounds.size.width - 10,( bounds.size.height - (bounds.size.height - image!.size.height)/4));
		CGContextClosePath(c);
		CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
		CGContextSetLineWidth(c, 5)
		CGContextStrokePath(c);
		
		// Trying to animate label
	
		UIView.animateWithDuration(24.5,
			delay: 0.0,
			options: UIViewAnimationOptions.CurveLinear,
			animations: {
				
				self.label.center = CGPointMake(
					self.bounds.size.width - 10,
					self.bounds.size.height - (self.bounds.size.height - image!.size.height)/4)
			},
			completion: nil);
		
}
}
