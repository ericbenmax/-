//
//  ViewController.swift
//  change
//
//  Created by Eric on 2022/8/2.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    let initialRed: Float = 126
    let initialGreen: Float = 255
    let initialBlue: Float = 100
    let initialAlpha: Float = 0.8
    let initialRed2: Float = 255
    let initialGreen2: Float = 220
    let initialBlue2: Float = 30
    let initialAlpha2: Float = 1
    let appleImage = UIImageView(image: UIImage(named: "Apple"))
    let pigaImage = UIImageView(image: UIImage(named: "image"))
    let pigaImage2 = UIImageView(image: UIImage(named: "image3"))
    let scrollViewPage = UIScrollView(frame: CGRect(x: 0, y: 65, width: 390, height: 338))
    let viewPage = UIView(frame: CGRect(x: 0, y: 19, width: 800, height: 300))
    let pageControl = UIPageControl(frame: CGRect(x: 139, y: 451, width: 113, height: 25))
    let redSlider = UISlider(frame: CGRect(x: 100, y: 550, width: 175, height: 30))
    let greenSlider = UISlider(frame: CGRect(x: 100, y: 610, width: 175, height: 30))
    let blueSlider = UISlider(frame: CGRect(x: 100, y: 670, width: 175, height: 30))
    let alphaSlider = UISlider(frame: CGRect(x: 100, y: 730, width: 175, height: 30))
    let redLabelValue = UILabel(frame: CGRect(x: 319, y: 550, width: 75, height: 30))
    let greenLabelValue = UILabel(frame: CGRect(x: 319, y: 610, width: 75, height: 30))
    let blueLabelValue = UILabel(frame: CGRect(x: 319, y: 670, width: 75, height: 30))
    let alphaLabelValue = UILabel(frame: CGRect(x: 319, y: 730, width: 75, height: 30))
    let redLabel = UILabel(frame: CGRect(x: 50, y: 550, width: 75, height: 30))
    let greenLabel = UILabel(frame: CGRect(x: 50, y: 610, width: 75, height: 30))
    let blueLabel = UILabel(frame: CGRect(x: 50, y: 670, width: 75, height: 30))
    let alphaLabel = UILabel(frame: CGRect(x: 20, y: 730, width: 75, height: 30))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        initial()
        rgbSlider()
        rgbLabel(redName: redSlider.value, greenName: greenSlider.value, blueName: blueSlider.value, alphaName: alphaSlider.value)
        
        
    }

    func rgbLabel(redName: Float, greenName: Float, blueName: Float, alphaName: Float) {
        
        redLabelValue.text = String(format: "%.0f", redName)
        greenLabelValue.text = String(format: "%.0f", greenName)
        blueLabelValue.text = String(format: "%.0f", blueName)
        alphaLabelValue.text = String(format: "%.1f", alphaName)
    }
    
    
    @objc func rgbSlider() {
       
        
        rgbLabel(redName: redSlider.value, greenName: greenSlider.value, blueName: blueSlider.value, alphaName: alphaSlider.value)
        
        
        pigaImage.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
        
        appleImage.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(page)
        
        if pageControl.currentPage == 1 {
            redSlider.value = initialRed2
            greenSlider.value = initialGreen2
            blueSlider.value = initialBlue2
            alphaSlider.value = initialAlpha2
            
            rgbLabel(redName: redSlider.value, greenName: greenSlider.value, blueName: blueSlider.value, alphaName: alphaSlider.value)
            
            pigaImage.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
        }
        else{
            
            redSlider.value = initialRed
            greenSlider.value = initialGreen
            blueSlider.value = initialBlue
            alphaSlider.value = initialAlpha
            
            rgbLabel(redName: redSlider.value, greenName: greenSlider.value, blueName: blueSlider.value, alphaName: alphaSlider.value)
            
            appleImage.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
            
        }
    }
    
    func initial() {
        
        view.addSubview(scrollViewPage)
        scrollViewPage.addSubview(viewPage)
        scrollViewPage.contentSize = CGSize(width: 800, height: 0)
        scrollViewPage.showsHorizontalScrollIndicator = false
        scrollViewPage.isPagingEnabled = true
        appleImage.frame = CGRect(x: 57, y: 15, width: 270, height: 270)
        pigaImage.frame = CGRect(x: 455, y: 15, width: 270, height: 270)
        pigaImage2.frame = pigaImage.frame
        pigaImage2.backgroundColor = UIColor.systemBackground
        pigaImage.mask = pigaImage2
        viewPage.addSubview(appleImage)
        viewPage.addSubview(pigaImage)
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        
        scrollViewDidEndDecelerating(scrollViewPage)
        scrollViewPage.delegate = self
        redSlider.addTarget(self, action: #selector(rgbSlider), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(rgbSlider), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(rgbSlider), for: .valueChanged)
        alphaSlider.addTarget(self, action: #selector(rgbSlider), for: .valueChanged)
        
        redSlider.maximumValue = Float(255)
        greenSlider.maximumValue = Float(255)
        blueSlider.maximumValue = Float(255)
        redSlider.isContinuous = true
        redSlider.tintColor = UIColor(red: CGFloat(1), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(1))
        greenSlider.tintColor = UIColor(red: CGFloat(0), green: CGFloat(1), blue: CGFloat(0), alpha: CGFloat(1))
        blueSlider.tintColor = UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(1), alpha: CGFloat(1))
        alphaSlider.tintColor = UIColor(red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(1), alpha: CGFloat(1))
        
        view.addSubview(pageControl)
        pageControl.pageIndicatorTintColor = UIColor(red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(0.5), alpha: CGFloat(0.8))
        pageControl.currentPageIndicatorTintColor = UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(1), alpha: CGFloat(1))
    
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(alphaSlider)
        view.addSubview(redLabelValue)
        redLabelValue.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(30))
        view.addSubview(blueLabelValue)
        blueLabelValue.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(30))
        view.addSubview(greenLabelValue)
        greenLabelValue.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(30))
        view.addSubview(alphaLabelValue)
        alphaLabelValue.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(30))
        
        view.addSubview(redLabel)
        redLabel.text = "R"
        redLabel.textColor = UIColor(red: CGFloat(1), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(1))
        redLabel.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(40))
        view.addSubview(greenLabel)
        greenLabel.text = "G"
        greenLabel.textColor = UIColor(red: CGFloat(0), green: CGFloat(1), blue: CGFloat(0), alpha: CGFloat(1))
        greenLabel.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(40))
        view.addSubview(blueLabel)
        blueLabel.text = "B"
        blueLabel.textColor = UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(1), alpha: CGFloat(1))
        blueLabel.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(40))
        view.addSubview(alphaLabel)
        alphaLabel.text = "Alpha"
        alphaLabel.textColor = UIColor(red: CGFloat(0.5), green: CGFloat(0.5), blue: CGFloat(1), alpha: CGFloat(1))
        alphaLabel.font = UIFont(name: "Nagurigaki Crayon", size: CGFloat(30))
        
        appleImage.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
     
        redSlider.value = initialRed
        greenSlider.value = initialGreen
        blueSlider.value = initialBlue
        alphaSlider.value = initialAlpha
    }
    
    
}

