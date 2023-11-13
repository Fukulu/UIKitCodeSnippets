//
//  ViewController.swift
//  UIKitCodeSnippets
//
//  Created by Furkan Tümay on 11/13/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - UIAlertFunction
    
    func presentAlert(){
        let alert = UIAlertController(title: "Title of Alert", message: "Message in Alert", preferredStyle: .alert)
        let actionButton1 = UIAlertAction(title: "Title of Action Button", style: .default) { actionButton1 in
            // Write the code to make functional the actionButton1
            print("actionButton1 Tapped")
        }
        let actionButton2 = UIAlertAction(title: "Title of Action Button", style: .default) { actionButton2 in
            // Write the code to make functional the actionButton2
            print("actionButton2 Tapped")
            
        }
        let close = UIAlertAction(title: "Close", style: .cancel)
        
        alert.addAction(actionButton1)
        alert.addAction(actionButton2)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }

    
    
    
        
    //MARK: - Configuration of Full Scale Navigation Bar Function
    
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
            //navBarAppearance.backgroundColor = backgoundColor
            navBarAppearance.configureWithTransparentBackground()

            // Create blur effect
            let visualEffectView = UIBlurEffect(style: .systemUltraThinMaterialLight)
            navBarAppearance.backgroundEffect = visualEffectView

            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
            
        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.barTintColor = backgoundColor
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.isTranslucent = true
            navigationItem.title = title
        }
    }
    
    // Function Usage Example
    // configureNavigationBar(largeTitleColor: .black, backgoundColor: UIColor.init(named: "ColorName") ?? .lightGray , tintColor: UIColor.init(named: "TextColorName") ?? .black , title: "Title on NavBar", preferredLargeTitle: false)
    
    
    
    
    
    //MARK: - Button Tapping Effects
    
    func pulsate(button: UIButton) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        button.layer.add(pulse, forKey: nil)
    }
    
    func flash(button: UIButton) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        button.layer.add(flash, forKey: nil)
    }
    
    func flashGreen(button: UIButton) {
        let flash = CABasicAnimation(keyPath: "backgroundColor")
        flash.duration = 0.3
        flash.fromValue = button.backgroundColor?.cgColor
        flash.toValue = UIColor(named: "GreenColor")!.cgColor
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        button.layer.add(flash, forKey: nil)
    }
    
    func flashRed(button: UIButton) {
        let flash = CABasicAnimation(keyPath: "backgroundColor")
        flash.duration = 0.3
        flash.fromValue = button.backgroundColor?.cgColor
        flash.toValue = UIColor(named: "RedColor")!.cgColor
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        button.layer.add(flash, forKey: nil)
    }
    
    
    
    
    
    
    //MARK: - Text to Speech Function
    
    // Don't forget the import
    // import AVFoundation
    
    func readWord(wordOnCard: String, choosenLanguage: String, speed: Float){
        let utterance = AVSpeechUtterance(string: wordOnCard)
        let voice = AVSpeechSynthesisVoice(language: choosenLanguage)
        utterance.voice = voice
        utterance.rate = speed
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    
    
    
    
    //MARK: - Button Title&Font Configuration and Design Function
        
    func configureButton(button: UIButton, arrayOfButtons: Array<UIButton?>, buttonTitleArray: Array<String>, buttonBGColor: String, buttonTintColor: String){
        
        var config = UIButton.Configuration.plain()
        var counter = 0
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.init(name: "Gill Sans Light", size: button.frame.width * 0.0895)
            return outgoing
            }
            
        for but in arrayOfButtons {
            but!.configuration = config
            but!.setTitle("\(buttonTitleArray[counter])", for: .normal)
            but?.tintColor = UIColor(named: buttonTintColor)
            but!.backgroundColor = UIColor(named: buttonBGColor)
            but!.layer.cornerRadius = 10
            counter += 1
                
            but!.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            but!.layer.shadowOffset = CGSize(width: 0, height: 3)
            but!.layer.shadowOpacity = 1.0
            but!.layer.shadowRadius = 5.0
            but!.layer.masksToBounds = false
        }
        counter = 0
            
    }
    
    // Using function Example
    // configureButton(button: button1, arrayOfButtons: [button1, button2, button3], buttonTitleArray: [MyButton1, MyButton2, MyButton3], buttonBGColor: "BackgroundColorName", buttonTintColor: "TextColorName")

    
    
    
    
    
    //MARK: - Add Image on Button with Title
    
    var addImageButtonConfig = UIButton.Configuration.plain()
    
    func addImage(button1: UIButton){
        addImageButtonConfig.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.init(name: "Your Font Name", size: button1.frame.width * 0.2)
            return outgoing
            }
        addImageButtonConfig.image = UIImage(systemName: "Sytyem Name of Image")
        addImageButtonConfig.imagePadding = 5.0
        addImageButtonConfig.imagePlacement = .top
    }
    
    // Other Usage Example
    // button2.config = addImageButtonConfig
    
    
    
    
    
    //MARK: - Adjust Dynamic Font Size, Color and Font for Labels Function
        
    func dynamicFontSize(labelList1: Array<UILabel>, dynamicFontSize1: Double, colorOfText: String, fontOfText: String, labelList2: Array<UILabel>?, dynamicFontSize2: Double?){
        // Specify or Declare your font size variable into your ViewController...
//        var dynamicFontSize1: Double = 32.0
//        var dynamicFontSize2: Double = 16.0

        // Add these to adjust your font size acc to PHONE size into your VIEWDIDLOAD...
//        dynamicFontSize1 = view.frame.height * 0.08
//        dynamicFontSize2 = view.frame.height * 0.04
        for lbl in labelList1 {
            lbl.adjustsFontSizeToFitWidth = true
            lbl.textColor = UIColor(named: colorOfText)
            lbl.font = UIFont(name: fontOfText, size: dynamicFontSize1)
        }
        if let labelList2 = labelList2 {
            if let dynamicFontSize2 = dynamicFontSize2 {
                for lbl in labelList2 {
                    lbl.adjustsFontSizeToFitWidth = true
                    lbl.textColor = UIColor(named: colorOfText)
                    lbl.font = UIFont(name: fontOfText, size: dynamicFontSize2)
                }
            }
        }
        
    }
    
    
    
    
    
    //MARK: - Add Shadow Function
        
    func addShadow(shadowElements:[Optional<UIView>]){
        for elements in shadowElements {
            elements!.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            elements!.layer.shadowOffset = CGSize(width: 0, height: 3)
            elements!.layer.shadowOpacity = 1.0
            elements!.layer.shadowRadius = 5.0
            elements!.layer.masksToBounds = false
        }
    }
    
    
    
    
    
    //MARK: - SETUP LINKS FOR WEBSITE AND EMAIL REDIRECTIONS
        
    func setupLink(label: UILabel, target: Selector) {
        // Altı çizili metni oluştur
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let range = NSRange(location: 0, length: attributedString.length)

        // Altı çizili stilini ve metin rengini ayarla
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "Your Color Name")!, range: range)
        attributedString.addAttribute(.font, value: UIFont(name: "Your Font Name", size: 32.0)!, range: range )

        // Altı çizili metne tıklama ekleyin
        let tapGesture = UITapGestureRecognizer(target: self, action: target)
        label.addGestureRecognizer(tapGesture)
        label.isUserInteractionEnabled = true

        // Etiketi güncelleyin
        label.attributedText = attributedString
    }

    @objc func openEmail() {
        if let url = URL(string: "mailto:foaltycoder@icloud.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func openPrivacyPolicy() {
        if let url = URL(string: "https://www.foaltycoder.co/privacy-policy") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc func openTermsOfUse() {
        if let url = URL(string: "https://www.foaltycoder.co/terms-of-use") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
        
    // Usage Example
//    setupLink(label: privacyPolicy, target: #selector(openPrivacyPolicy))
//    setupLink(label: termsOfUse, target: #selector(openTermsOfUse))
//    setupLink(label: helpInfoLabel, target: #selector(openEmail))
    
    
    
    
    
    //MARK: - User Defaults Usage
    
    static var userFavoriteColor : String = ""
    
    // Setting User Preferences
    func saveColorPreferences(){
        UserDefaults.standard.set("Yellow", forKey: "SelectedColor")
    }
    
    // Add this in appDelegate to get info before Launching the App
//    if let selectedColorName = UserDefaults.standard.string(forKey: "SelectedColor") {
//        ViewController.userFavoriteColor = selectedColorName
//    }
    
    

    
    
}





//MARK: - Add Seperator Between Views

extension UIView{
    
    enum SeparatorPosition {
        case top
        case bottom
        case left
        case right
    }

    @discardableResult
    func addSeparator(at position: SeparatorPosition, color: UIColor, weight: CGFloat = 1.0 / UIScreen.main.scale, insets: UIEdgeInsets = .zero) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
            
        switch position {
        case .top:
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left).isActive = true
            view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right).isActive = true
            view.heightAnchor.constraint(equalToConstant: weight).isActive = true
                
        case .bottom:
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left).isActive = true
            view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right).isActive = true
            view.heightAnchor.constraint(equalToConstant: weight).isActive = true
                
        case .left:
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left).isActive = true
            view.widthAnchor.constraint(equalToConstant: weight).isActive = true
                
        case .right:
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom).isActive = true
            view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right).isActive = true
            view.widthAnchor.constraint(equalToConstant: weight).isActive = true
            }
            
        return view
    }

    
    // Function Usage Example (Add lightgray seperator line bottom of Label)
    // foreignSentenceLabel.addSeparator(at: .bottom, color: .lightGray)
}





//MARK: - GIF Extension for IMAGEVIEW

// RESPECTED:
//https://medium.com/@JaydipDeveloper/how-to-load-gif-in-uiimageview-in-swift-626b02259b58

extension UIImageView {
    public func loadGif(name: String) {
        DispatchQueue.global().async {
            let image = UIImage.gif(name: name)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

extension UIImage {
    public class func gif(data: Data) -> UIImage? {
        // Create source from data
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("SwiftGif: Source for the image does not exist")
            return nil
        }
        return UIImage.animatedImageWithSource(source)
    }
    public class func gif(url: String) -> UIImage? {
        // Validate URL
        guard let bundleURL = URL(string: url) else {
            print("SwiftGif: This image named \"\(url)\" does not exist")
            return nil
        }
        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(url)\" into NSData")
            return nil
        }
        return gif(data: imageData)
    }
    public class func gif(name: String) -> UIImage? {
        // Check for existance of gif
        guard let bundleURL = Bundle.main
                .url(forResource: name, withExtension: "gif") else {
                    print("SwiftGif: This image named \"\(name)\" does not exist")
                    return nil
                }
        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        return gif(data: imageData)
    }
    internal class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        // Get dictionaries
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
        if CFDictionaryGetValueIfPresent(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque(), gifPropertiesPointer) == false {
            return delay
        }
        let gifProperties:CFDictionary = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)
        // Get delay time
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                             Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        delay = delayObject as? Double ?? 0
        if delay < 0.1 {
            delay = 0.1 // Make sure they're not too fast
        }
        return delay
    }
    internal class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        // Check if one of them is nil
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        // Swap for modulo
        if a! < b! {
            let c = a
            a = b
            b = c
        }
        // Get greatest common divisor
        var rest: Int
        while true {
            rest = a! % b!
            if rest == 0 {
                return b! // Found it
            } else {
                a = b
                b = rest
            }
        }
    }
    internal class func gcdForArray(_ array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        var gcd = array[0]
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        return gcd
    }
    internal class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        // Fill arrays
        for i in 0..<count {
            // Add image
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            // At it's delay in cs
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                                                            source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        // Calculate full duration
        let duration: Int = {
            var sum = 0
            for val: Int in delays {
                sum += val
            }
            return sum
        }()
        // Get frames
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        // Heyhey
        let animation = UIImage.animatedImage(with: frames,
                                              duration: Double(duration) / 1000.0)
        return animation
    }
    
    
    // USAGE EXAMPLE
    // @IBOutlet weak var gifView: UIImageView!
    // self.gifView.loadGif(name: "Your gifName on Assets")
}
