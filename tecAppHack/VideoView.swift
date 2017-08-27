//
//  VideoView.swift
//  tecAppHack
//
//  Created by Mm on 27/08/17.
//  Copyright © 2017 Mm. All rights reserved.
//

import UIKit

class VideoView: UIViewController {
    @IBOutlet var videoView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://www.youtube.com/embed/xQhEe-7ZuPc"

        
        videoView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"\(url)/\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
