//
//  ViewController.swift
//  customCamera
//
//  Created by mac on 5/22/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var captureSession = AVCaptureSession()
    var backCamera : AVCaptureDevice?
    var frontCamera :  AVCaptureDevice?
    var currentCamera : AVCaptureDevice?
    var photoOutput : AVCapturePhotoOutput?
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    var image : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }


    @IBAction func cameraButton(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
       
      
    }
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    func setupDevice(){
        let deviceDiscoverSession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
        let devices = deviceDiscoverSession.devices
        
        for device in devices{
            if device.position == AVCaptureDevice.Position.back{
                backCamera = device
            }else if device.position == AVCaptureDevice.Position.front{
                frontCamera = device
            }
           
        }
         currentCamera = backCamera
    }
    func setupInputOutput(){
        do{
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
                photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey:AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
            
            
        }catch{
            print(error)
        }
    }
    func setupPreviewLayer(){
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    func startRunningCaptureSession(){
        captureSession.startRunning()
    }
   @objc override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showPhotoSegue"){
            let previewVC = segue.destination as! PreviewViewController
            previewVC.image = self.image
        }
    }
}

extension ViewController: AVCapturePhotoCaptureDelegate{
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation(){
            image = UIImage(data: imageData)
             performSegue(withIdentifier: "showPhotoSegue", sender: nil)
            
        }
    }
}
