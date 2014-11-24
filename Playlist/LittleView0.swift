//
//  LittleView0.swift
//  Playlist
//
//  Created by Zhanna Fursova on 11/22/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//


import UIKit

class LittleView0: UIView {

	override init() {
		super.init(frame: CGRectZero);
		//If the superview of this LittleView0 changes size,
		//make this LittleView0 change size with it.
		autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
		backgroundColor = UIColor.blackColor();
		
	}

	//Never called, but needed in order to compile.

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		backgroundColor = UIColor.blackColor();
		
	}

	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.

	override func drawRect(rect: CGRect) {

		let w: CGFloat = bounds.size.width;
		let h: CGFloat = bounds.size.height;

		let image: UIImage? = UIImage(named: "pretty-reckless.png");
		if image == nil {
		println("could not find pretty-reckless.png");
		return;
		}


		let point: CGPoint = CGPointMake(
		(w - image!.size.width) / 2,
		(h - image!.size.height) / 2);

		image!.drawAtPoint(point);

	}


}