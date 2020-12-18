//
//  DetailViewController.swift
//  NYNewsTimes
//
//  Created by Apple on 18/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var thumpImageView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCaption: UILabel!
    /// properties
    
    var selectedResult : Result?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let back = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = back

        self.configureUI()
    }
    
    class func create()->DetailViewController {
         let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
         return controller
     }
    func configureUI() {
        if let result = selectedResult{
            self.title = result.source
            if let imgVw = self.thumpImageView {
                if let imageURLString = result.media?.first?.mediaMetadata?.first?.url, let imageURL = URL(string: imageURLString){
                    imgVw.kf.indicatorType = .activity
                    imgVw.kf.setImage(with: imageURL, options: [.transition(.fade(0.2))])
                }
            }
            
            if let title = self.lblTitle {
                title.text = result.title
            }
           
            if let caption = result.media?.first?.caption
            {
                self.lblCaption.text = caption
            }
            
        }
        
    }
    
    @objc func backAction()
    {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
