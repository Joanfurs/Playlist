//
//  View.swift
//  Playlist
//
//  Created by Zhanna Fursova on 11/22/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//


import UIKit

class View: UIView {
	let littleViews: [UIView] = [	//an array containing two LittleView objects
		LittleView0 (),
		LittleView1 (),
		LittleView2()
	];

	//index in the littleViews array of the currently displayed subview: 0 or 1
	var index: Int = 0;

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		//Make littleViews[index] the same size as this View.
		littleViews[index].frame = bounds;
		addSubview(littleViews[index]);
	}

	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		if index < 2 {
		let newIndex: Int =  1 + index;	//toggle the index
		
		//Make littleViews[newIndex] the same size as this View.
		littleViews[newIndex].frame = bounds;

		UIView.transitionFromView(littleViews[index],
			toView: littleViews[newIndex],
			duration: 2.25,
			options: UIViewAnimationOptions.TransitionFlipFromLeft,
			completion: nil);

		index = newIndex;
	}   else {
	
		let newIndex: Int = 0;	//toggle the index
		
		//Make littleViews[newIndex] the same size as this View.
		littleViews[newIndex].frame = bounds;

		UIView.transitionFromView(littleViews[index],
			toView: littleViews[newIndex],
			duration: 2.25,
			options: UIViewAnimationOptions.TransitionFlipFromLeft,
			completion: nil);

		index = newIndex;
		}

	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect) {
		// Drawing code}
	*/

}
}