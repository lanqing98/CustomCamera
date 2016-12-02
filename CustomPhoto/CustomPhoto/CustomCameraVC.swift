//
//  CustomCameraVC.swift
//  CustomPhoto
//
//  Created by 杨岚清 on 2016/12/2.
//  Copyright © 2016年 Ylqing. All rights reserved.
//

import UIKit
import AVFoundation

class CustomCameraVC: UIViewController {

    var deviceIntput:AVCaptureDeviceInput?;
    var stillImageOutPut:AVCapturePhotoOutput?;//AVCaptureStillImageOutput?;
    var session:AVCaptureSession = AVCaptureSession.init();
    var previewLayer:AVCaptureVideoPreviewLayer?;
    override func viewDidLoad() {
        super.viewDidLoad()
        initAVCapture();
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        session.startRunning();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        session.stopRunning();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initAVCapture() {
        //自定义相机
        if let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) {
            try! device.lockForConfiguration();
            device.focusMode = .autoFocus;
            device.unlockForConfiguration();
            deviceIntput = try! AVCaptureDeviceInput.init(device: device);
            if self.session.canAddInput(deviceIntput) {
                self.session.addInput(deviceIntput);
            }
            previewLayer = AVCaptureVideoPreviewLayer.init(session: session);
            previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect;
            previewLayer?.frame = self.view.bounds;
            self.view.layer.addSublayer(previewLayer!);
        }
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
