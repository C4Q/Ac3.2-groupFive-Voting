//
//  RepDetailsViewController.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import MessageUI
import AudioToolbox

class RepDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var repImageView: UIImageView!
    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var briefJobDescription: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneNumberButton: UIButton!
    
    var official: GovernmentOfficial!
    var office: Office!
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        inputViewValues()
        
        APIRequestManager.manager.getArticles(searchTerm: official.name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!) { (info) in
            if let info = info {
                self.articles = info
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
        }
        
        title = self.repNameLabel.text
        
        collectionView.register(HeadlinesCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        print(articles)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.repImageView.layer.cornerRadius = 60
        self.repImageView.clipsToBounds = true
        self.repImageView.contentMode = .scaleAspectFit
    }
    
    func inputViewValues () {
        self.repNameLabel.text = official.name
        self.repImageView.image = UIImage(named: "placeholderPic")

        if let phone = official.phone, let email = official.email {
        self.phoneNumberButton.setTitle("\(phone)", for: .normal)
        self.emailButton.setTitle("\(email)", for: .normal)
        }
        
        if let photoURL = official.photoURL {
            APIRequestManager.manager.getImage(APIEndpoint: photoURL) { (data) in
                if let validData = data,
                    let validImage = UIImage(data: validData) {
                    DispatchQueue.main.async {
                        self.repImageView.image = validImage
                    }
                }
            }
        }
    
    
        
//                self.iconImageView = {
//                    let imageView = UIImageView()
//                    switch self.official.party {
//                    case _ where self.official.party.contains("Democrat"):
//                        self.iconImageView.image = #imageLiteral(resourceName: "democrat")
//                    case "Republican":
//                        self.iconImageView.image = #imageLiteral(resourceName: "republican")
//                    default:
//                        self.iconImageView.image = #imageLiteral(resourceName: "defaultParty")
//                    }
//                    imageView.contentMode = .center
//                    imageView.backgroundColor = UIColor.hackathonWhite
//                    imageView.layer.cornerRadius = 20
//                    imageView.layer.borderColor = UIColor.hackathonBlue.cgColor
//                    imageView.layer.borderWidth = 0.75
//                    return imageView
//                }()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: - Collection View Data Source Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HeadlinesCollectionViewCell
        //cell.backgroundColor = .cyan
        cell.article = articles[indexPath.row]
        
        return cell
    }
    
    //MARK: - Helper Functions
    
    func callNumber(_ weirdPhoneNumber: String) {
        let numbers = Set<Character>(arrayLiteral: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
        let validPhoneNumber = weirdPhoneNumber.characters.filter { numbers.contains($0) }
        let phoneNumber = String(validPhoneNumber)
        print(phoneNumber)
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func emailPerson() {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    //MARK: - Actions
       
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([self.official.email ?? "sgrant001@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        //Can ya please redo this alert marty?
        
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

 
    
    @IBAction func phoneButtonPressed(_ sender: UIButton) {
        if let number = self.official.phone {
            callNumber(number)
        } else {
            //ADD ALERT ABOUT LACKING PHONE NUMBER
        }
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        self.emailPerson()
    }
    
    // MARK: - Noise
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController){
            AudioServicesPlaySystemSound(1105)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        AudioServicesPlaySystemSound(1105)
    }
}


