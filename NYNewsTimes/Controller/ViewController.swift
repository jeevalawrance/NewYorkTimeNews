//
//  ViewController.swift
//  NYNewsTimes
//
//  Created by Jeeva on 16/12/20.
//

import UIKit

class ViewController: BaseViewControllerViewController {
    /// IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    /// Properties
    var nYMostPopularViewModel = NYMostPopularViewModel()
    var arrayOfNews  = [Result]()
    let child = SpinnerViewController()
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "NY Times Most Popular"

        let menu = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(menuTapped))

        let searchItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchTapped))
        
        let vertical = UIBarButtonItem(image: UIImage(named: "vertical"), style: .plain, target: self, action: #selector(filterTapped))
        
        navigationItem.leftBarButtonItem = menu

        navigationItem.rightBarButtonItems = [vertical,searchItem]

        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshService), for: .valueChanged)

        setupTableviewCell()
        
        refreshService()
    }
    @objc func searchTapped()
    {
        
    }
    @objc func filterTapped()
    {
        
    }
    @objc func menuTapped()
    {
        
    }
    @objc func refreshService() {
        if isConnectedToNetwork() {
            callNYMostPopularNewsList()
        }
        else{
            DispatchQueue.main.async {
                   self.refreshControl.endRefreshing()
               }
            self.showAlert(withTitle: "Oops", message: Constants.InternetErrorMessage)
        }
    }
    func setupTableviewCell(){
        tableView.register(UINib(nibName: PopularNewsCell.cellXib, bundle: Bundle(for: PopularNewsCell.self)), forCellReuseIdentifier: PopularNewsCell.cellIdentifier)
        
        tableView.tableFooterView = UIView()
 
    }
    /// Webservice call for getting news list
    func callNYMostPopularNewsList() {
        self.createSpinnerView()
        nYMostPopularViewModel.getTopNewsList(section: "all-sections", period: 7) { response,status  in
            if status{
                if let responseNews = response?.results{
                    self.arrayOfNews = responseNews
                    self.tableView.reloadData()
                }
                else{
                    self.showAlert(withTitle: "Error", message: Constants.ErrorMsg)
                }
            }
            // wait two seconds to simulate some work happening
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // then remove the spinner view controller
                self.child.willMove(toParent: nil)
                self.child.view.removeFromSuperview()
                self.child.removeFromParent()
                
                DispatchQueue.main.async {
                       self.refreshControl.endRefreshing()
                   }
            }
        }
    }

    func createSpinnerView() {

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

    }
}

// MARK: - Tableview Datasource & Delegate
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PopularNewsCell = tableView.dequeueReusableCell(withIdentifier: PopularNewsCell.cellIdentifier, for: indexPath) as! PopularNewsCell
        cell.bindDataOnCell(news: arrayOfNews[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController.create()
        controller.selectedResult = arrayOfNews[indexPath.row]
        self.push(controller)

    }
    func push(_ controller: UIViewController) {
        controller.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
