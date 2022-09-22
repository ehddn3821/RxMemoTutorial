//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/01.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoDetailViewModel!
    
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    func bindViewModel() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
