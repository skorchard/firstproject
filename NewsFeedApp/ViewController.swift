//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by M1086289 on 08/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var datalist = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchJsonFromLoacl()
        // Do any additional setup after loading the view.
    }
    
    func fetchJsonFromLoacl() {
        if let path = Bundle.main.path(forResource: "jsonformatter", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsondata = try JSONDecoder().decode(ArticlesData.self, from: data)
                datalist = jsondata.articles ?? []
              } catch {
                  print("error obtaining \(error)")
              }
        }
    }
    
    
    func jsonDownload() {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-06-08&to=2022-06-08&sortBy=popularity&apiKey=937b830a7d034fb6b3b9487f38f43e51") else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                print("success")
            }
        }
        dataTask.resume()
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsFeedTableViewCell else { return UITableViewCell() }
        let article = datalist[indexPath.row]
        cell.titleLabel.text = article.title
        cell.authorLabel.text = article.author
        cell.publishedLabel.text = article.publishedAt
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    


}

