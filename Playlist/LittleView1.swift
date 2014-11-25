
import UIKit

class LittleView1 : UIView {

	let littleRectangle: UIView = UIView();

	override init() {
		super.init(frame: CGRectZero);
		littleRectangle.backgroundColor = UIColor.whiteColor();
		addSubview(littleRectangle);
		autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
		backgroundColor = UIColor.blackColor();
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		backgroundColor = UIColor.blackColor();
	}

	override func drawRect(rect: CGRect) {
	
		// Placing name of a song
	
		let s: String = "Make Me Wanna Die";

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
		
		// Placing small rectangle on a time line

		var r: CGRect = CGRectMake(
			applicationFrame.origin.x + 10,
			( bounds.size.height - (bounds.size.height - image!.size.height)/4) - 8,
			8,
			16);
		
		littleRectangle.frame = r;

		// Trying to animate rectangle

		UIView.animateWithDuration(236.0,
			delay: 1.0,
			options:  UIViewAnimationOptions.CurveLinear,
			animations: {
				self.littleRectangle.center = CGPointMake(
					applicationFrame.origin.x + applicationFrame.width - 14,
					self.littleRectangle.center.y);
			},
			completion: nil);
		
		}
}