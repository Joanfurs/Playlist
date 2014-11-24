

import UIKit;
import AVFoundation;

class ViewController: UIViewController {

	var player: AVAudioPlayer?;
	
	override func viewDidLoad(/*littleViews: UIView!*/) {
	
		
		let bundle: NSBundle? = NSBundle.mainBundle();
		if bundle == nil {
			println("could not get the main bundle");
			return;
		}
		println("bundle.bundlePath = \"\(bundle!.bundlePath)\"\n");
		

		// Creating 2 paths
		
		// 1st path
		
		let path: String? = bundle!.pathForResource("03", ofType: "mp3");
		if path == nil {
			println("could not find the path");
			return;
		}
		println("path = \"\(path!)\"\n");
		
	
		// 2nd path
		
		let path2: String? = bundle!.pathForResource("06", ofType: "mp3");
		if path2 == nil {
			println("could not find the path");
			return;
		}
		println("path2 = \"\(path2!)\"\n");
		
	
		// Trying to connect URL choice
		/*
		var url: NSURL?
		if littleViews == LittleView1 () {

		var url: NSURL? = NSURL(fileURLWithPath: path!, isDirectory: false);
		if url == nil {
			println("could not create url");
			return;
		}
		println("url = \"\(url!)\"\n");
		} if littleViews == LittleView2 () {  */
		var url: NSURL? = NSURL(fileURLWithPath: path2!, isDirectory: false);
		if url == nil {
			println("could not create url");
			return;
		}
		/*
		}
		*/

		
		var error: NSError?;
		player = AVAudioPlayer(contentsOfURL: url!, error: &error);
		if player == nil {
			println("could not create AVAudioPlayer: \(error!)");
			return;
		}

		player!.volume = 1.0;
		player!.pan = 0.0;
		player!.numberOfLoops = 0;
		println("player.numberOfChannels = \(player!.numberOfChannels)");

		if !player!.prepareToPlay() {
			println("could not prepare to play");
			return;
		}

		if !player!.play() {
			println("could not prepare to play");
		}
		
		player!.play()
	
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}