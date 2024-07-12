//
//  home page ViewController.swift
//  Login and home page
//
//  Created by irohub on 11/07/24.
//  Copyright © 2024 nimisha. All rights reserved.
//

import UIKit

class home_page_ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBAction func logoutbtn(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        
        let pull = UIStoryboard(name: "Main", bundle: nil)
        let tops = pull.instantiateViewController(identifier: "log") as!loginViewController
        self.navigationController?.pushViewController(tops, animated: true)
        
    }
   
    @IBOutlet weak var tableref: UITableView!
    
    var arr = NSArray()
    var dict = NSDictionary()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tab = tableView.dequeueReusableCell(withIdentifier: "cell1") as!homeTableViewCell
        self.dict = self.arr[indexPath.row] as!NSDictionary
        tab.labelcell1.text = self.dict["author"] as?String
        
        let imgurl = String(describing:self.dict["download_url"]!)
        let urlimg = URL(string:imgurl)
        let dataimg = try? Data(contentsOf: urlimg!)
        tab.imgcell.image = UIImage(data:dataimg!)
        return tab
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url1 = URL(string:"https://picsum.photos/v2/list")
        let urlreq2 = URLRequest(url: url1!)
        let task =  URLSession.shared.dataTask(with: urlreq2){(data,request,Error)in
             if let mydata = data

                {
                    print("mydata-->>",mydata)
                    do
                    {
                        self.arr = try JSONSerialization.jsonObject(with: mydata, options:[]) as!NSArray

                        print("jsondata",self.arr)
                        DispatchQueue.main.async
                            {
                            self.tableref.reloadData()
                        }}catch{
                            print("error")
                    }
            }
        
        

        // Do any additional setup after loading the view.
        }
        task.resume()

        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        

        

}

