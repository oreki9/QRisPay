// 
//  ScanView.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit
import AVFoundation

class ScanView: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var toolbar: ToolbarView!
    @IBOutlet weak var cameraFeed: UIView!
    //MARK: - Property ScanView
    
    
    var presenter: VTPScanProtocol?

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
    
    //MARK: - Lifecycle ScanView
    override func viewDidLoad() {
        setUpView()
        setupAction()
        setupData()
    }
}
extension ScanView {
    func setupAction(){}
    func setupData(){}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // navigationController?.setNavigationBarHidden(true, animated: animated)
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    // MARK: - Prepare View & onClick ScanQRVC
    func setUpView(){
        toolbar.setToolbar(title: "Scan QR")
        toolbar.delegate = self
        checkPermissions()
    }
    
    //MARK: - Function ScanView
    

    //MARK: - Function Action ScanView
    func setUpScanQrCamera(){
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            if (captureSession?.canAddInput(videoInput) ?? false) {
                captureSession?.addInput(videoInput)
            } else {
                print("Could not add video input to the session")
                return
            }

            let metadataOutput = AVCaptureMetadataOutput()

            if (captureSession?.canAddOutput(metadataOutput) ?? false) {
                captureSession?.addOutput(metadataOutput)

                // Configure delegate and metadata types as needed

                // Example: Set delegate and metadata types
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
                DispatchQueue.global(qos: .userInitiated).async {
                    guard let captureSession = self.captureSession else { return }
                    self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    self.previewLayer?.videoGravity = .resizeAspectFill
                    self.previewLayer?.frame = self.cameraFeed.bounds

                    if let previewLayer = self.previewLayer {
                        DispatchQueue.main.async {
                            self.captureSession?.startRunning()
                            self.cameraFeed.layer.insertSublayer(previewLayer, at: 0)
                        }
                    }
                    print("running camera")
                }
            } else {
                print("Could not add metadata output to the session")
                return
            }
        } catch {
            print("Error configuring capture session: \(error.localizedDescription)")
        }
    }
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    func found(code: String) {
        if let nav = self.navigationController {
            let arrayResponseQR = code.components(separatedBy: ".")
            let bankReceiver = arrayResponseQR.safeGet(index: 0)
            let idTrans = arrayResponseQR.safeGet(index: 1)
            let nameReceiver = arrayResponseQR.safeGet(index: 2)
            let amountPaid : Double = arrayResponseQR.safeGet(index: 3).ToDouble()
            AppSetting.shared.balance-=amountPaid
            let resultScan = ResultPayEntity(amountPaid, nameReceiver, idTrans, bankReceiver)
            AppSetting.shared.savePay(resultScan)
            self.presenter?.goToScreenSuccess(data: resultScan, nav: nav)
        }
    }
    
    func checkPermissions(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .denied:
                self.showAlerPermissions()
            case .restricted:
                self.showAlerPermissions()
            case .authorized:
                DispatchQueue.global(qos: .userInitiated).async {
                    self.setUpScanQrCamera()
                }
            case .notDetermined:
                print("is not determined")
                AVCaptureDevice.requestAccess(for: .video) { (granted: Bool) in
                    DispatchQueue.main.async { [unowned self] in
                        if granted {
                            self.setUpScanQrCamera()
                        }
                    }
                }
            default:
                break
        }
    }
    
    func showAlerPermissions(){
        let alertController = UIAlertController (title: "Title", message: "message", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return}
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: nil)
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
        return true
    }
}

//MARK: - Extension ScanView
extension ScanView: PTVScanProtocol {

}
extension ScanView : AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            captureSession.stopRunning()
            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                guard let stringValue = readableObject.stringValue else { return }
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                found(code: stringValue)
            }
        }
}
extension ScanView : ToolbarViewDelegate {
    func pressBack() {
        if let nav = self.navigationController {
            presenter?.pushBackVC(nav: nav)
        }
    }
}
