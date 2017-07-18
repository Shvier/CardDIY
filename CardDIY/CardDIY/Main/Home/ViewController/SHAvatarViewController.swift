//
//  SHAvatarViewController.swift
//  CardDIY
//
//  Created by shvier on 05/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices
import TOCropViewController

class SHAvatarViewController: SHBaseViewController {
    
    let avatarImageViewOffsetCenterY: CGFloat = 15.5
    let avatarImageViewWidth: CGFloat = 210
    let avatarImageViewHeight: CGFloat = 214.5
    
    var cardImage: UIImage?
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var avatarImageView: UIImageView?
    
    func tapAction(tap: UITapGestureRecognizer) {
        requestPhotoPermission()
    }
    
    func requestPhotoPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .authorized || status == .notDetermined {
            let imagePickerController = UIImagePickerController()
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.mediaTypes = [String.init(kUTTypeImage)]
            }
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = false
            present(imagePickerController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "提示", message: "请开启相册访问权限", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "去设置", style: .default, handler: { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                if UIApplication.shared.canOpenURL(url!) {
                    let url = URL(string: UIApplicationOpenSettingsURLString)
                    UIApplication.shared.openURL(url!)
                }
            })
            let cancelAction = UIAlertAction(title: "取消", style: .default, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func imageDidFinishSaving(image: UIImage, error: NSError?, contextInfo: UnsafeMutableRawPointer?) {
        if error != nil {
            
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func saveBarItemAction(sender: UIBarButtonItem) {
        UIImageWriteToSavedPhotosAlbum((cardContentView?.currentImage())!, self, #selector(imageDidFinishSaving(image:error:contextInfo:)), nil)
    }
    
    func shareBarItemAction(sender: UIBarButtonItem) {
        
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        navigationTitle = "请挑选卡牌图案"
        
        cardContentView = ({
            let view = UIView()
            return view
        })()
        view.addSubview(cardContentView!)
        
        cardImageView = ({
            let imageView = UIImageView()
            imageView.image = cardImage
            return imageView
        })()
        cardContentView!.addSubview(cardImageView!)
        
        avatarImageView = ({
            let imageView = UIImageView()
            imageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(tap:)))
            imageView.addGestureRecognizer(tap)
            return imageView
        })()
        cardContentView!.addSubview(avatarImageView!)
    }
    
    func makeConstraints() {
        cardContentView?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(cardMadeViewMargin)
            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.centerY.equalTo(view)
            make.height.equalTo((cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        cardImageView?.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(cardContentView!)
        })
        
        avatarImageView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardContentView!)
            make.centerY.equalTo(cardContentView!).offset(-avatarImageViewOffsetCenterY)
            make.width.equalTo(avatarImageViewWidth)
            make.height.equalTo(avatarImageViewHeight)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        makeConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SHAvatarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let cropViewController = TOCropViewController(croppingStyle: .default, image: image)
        cropViewController.delegate = self
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.customAspectRatio = CGSize(width: avatarImageViewWidth, height: avatarImageViewHeight)
        cropViewController.aspectRatioPreset = .presetCustom
        cropViewController.resetAspectRatioEnabled = false
        picker.dismiss(animated: true) { 
            self.present(cropViewController, animated: true, completion: nil)
        }
    }
    
}

extension SHAvatarViewController: TOCropViewControllerDelegate {
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropToImage image: UIImage, rect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true, completion: {
            self.avatarImageView?.image = image
        })
    }
    
}
