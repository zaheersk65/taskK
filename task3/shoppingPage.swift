//
//  shoppingPage.swift
//  task3
//
//  Created by IMAC on 7/16/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//MARK: Global Variable
//This is used for declaring global variable that we can use any class and any view controller
struct global {
   static var title = ["BEVERAGES","BREAD & DAIRY","CANS & JARS","GROCERY","HOME CARE","PERSONAL CARE","SNACKS"]
   static var description = ["Canned Fruit Drink,juices","Cream,Milk","Spreads","Flour,Other Grocery,Pulses,Rice,Salt,sugar","Air Fresheners,Cleaning,Laundry","Deo & Fragrance,Facial Care,Hair Care,Mens Care,Others","Popcorn"]
 

}

class shoppingPage: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionImageView {
            return sliderArray.count
        }else {
            return array.count
        }
    }
       
    
    func urlPAra() {
        
        
        let url = "http://www.247basket.com/services/getStoreBanners"
        
        let parameters: Parameters =
            [
                "client_key" : "kiranaking777",
                "store_id" : ""
                
        ]
        
       getData(url: url, parameters: parameters as! [String : String])
    }
    //MARK: - Networking
    /***************************************************************/

    //Write the getWeatherData method here:

    func getData(url: String, parameters: [String: String]) {

        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in

            if response.result.isSuccess {
                
                //This is used add the server data to webServerData Varaible
                let webServerData : JSON = JSON(response.result.value!)
                 print("Details \(webServerData)")
                
                if webServerData["code"] == 200 {
                    
                    self.updateData(json: webServerData)
                    
                }
            }
        }

    }
//
    //Write the update Data method here:

    func updateData(json : JSON) {
        
        print(json)
        
       let image1 = json["data"][0]["store_banner"][0]["image_name"].stringValue
        print("image1 url is \(image1)")
       let image2 = json["data"][0]["store_banner"][1]["image_name"].stringValue
        let image3 = json["data"][0]["store_banner"][2]["image_name"].stringValue

      
        
        if let url1 = URL(string: image1) {
            
            do {
                let data = try Data(contentsOf: url1)
                
                sliderArray.append(UIImage(data: data)!)
                //This is for adding url image link to array
                //self.imageView.image = UIImage(data: data)
                print("sliderArray image 1 \(sliderArray)")
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        
        if let url2 = URL(string: image2) {
            
            do {
                let data = try Data(contentsOf: url2)
                
                sliderArray.append(UIImage(data: data)!)//This is for adding url image link to array
                //self.imageView.image = UIImage(data: data)
                
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
//
        if let url3 = URL(string: image3) {

                   do {
                       let data = try Data(contentsOf: url3)

                       
                    sliderArray.append(UIImage(data: data)!)//This is for adding url image link to array
                       //self.imageView.image = UIImage(data: data)

                   } catch let err {
                       print("Error: \(err.localizedDescription)")
                   }
               }
               
          print("sliderArray \(sliderArray)")
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = self.collectionImageView.dequeueReusableCell(withReuseIdentifier: "collectionImage", for: indexPath) as! collectionImage
        cell.imageView.image = sliderArray[indexPath.row]
            
        return cell
//        if collectionView == self.collectionImageView {
//        let cell = self.collectionImageView.dequeueReusableCell(withReuseIdentifier: "collectionImage", for: indexPath) as! collection
//        cell.imageView.image = sliderArray[indexPath.row] as! UIImage
//
//        return cell
//        } else  {
//            let item = self.collectionLabel.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
//            item.labelText.text = array[indexPath.row]
//            return item
//        }
//
    }
//
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionLabel{
            
//            self.tabBarController!.tabBar.isHidden = true//This is used for hidding tab bar controller
            
            if (indexPath.item == 0) {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! Details
                self.navigationController?.pushViewController(vc, animated:     true)
                print("First")
            }
            else if (indexPath.item == 1)  {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! Details
                
            //vc.collctionView.isHidden = true
                print("second")
                self.navigationController?.pushViewController(vc, animated:     true)
            }
            else if array[indexPath.row] == "TOP SELLARS" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! Details
                self.navigationController?.pushViewController(vc, animated:     true)
                print("third")
            }
        }

        
    }
    
  
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionImageView: UICollectionView!
   
    var timer = Timer()
    var counter = 0
    
    
    
    
    
    
    //var arr = ["Sorry no offer available"]
    @IBOutlet weak var collectionLabel: UICollectionView!
    var array = ["NEW ARRIVALS","OFFERS","TOP SELLARS","Next"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        
        
        
        
        //web service to get image
        
        
       
//
//        if let url = URL(string: "http://www.247basket.com/images/homebanner/homebanner_06aaddee5f79e56485dabb8f9c7b368a.jpg") {
//
//            do {
//                let data = try Data(contentsOf: url)
//
//                self.sliderArray.append(UIImage(data: data)!)//This is for adding url image link to array
//                //self.imageView.image = UIImage(data: data)
//
//            } catch let err {
//                print("Error: \(err.localizedDescription)")
//            }
//        }//This is for displaying image with url
//
//        if let url = URL(string: "http://www.247basket.com/images/homebanner/homebanner_79809ff8d51f88ccf657e452df30d27c.jpg") {
//
//            do {
//                let data = try Data(contentsOf: url)
//
//                self.sliderArray.append(UIImage(data: data)!)//This is for adding url image link to array
//                //self.imageView.image = UIImage(data: data)
//
//            } catch let err {
//                print("Error: \(err.localizedDescription)")
//            }
//        }
//        if let url = URL(string: "https://i.ytimg.com/vi/CRS9YTgjHK4/maxresdefault.jpg") {
//
//            do {
//                let data = try Data(contentsOf: url)
//
//                self.sliderArray.append(UIImage(data: data)!)//This is for adding url image link to array
//                //self.imageView.image = UIImage(data: data)
//
//            } catch let err {
//                print("Error: \(err.localizedDescription)")
//            }
//        }
        
        //This is for table view images in prototype cells
        if let url = URL(string: "https://imgcp.aacdn.jp/img-a/1720/auto/global-aaj-front/article/2016/02/56b9a4f563c99_56b9a4c99915d_1461357925.jpg") {
            //https://mahadevibakers.com/wp-content/uploads/2018/08/About-Beverages-1_gl4_1.jpg
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        if let url = URL(string: "https://images.media-allrecipes.com/userphotos/560x315/5863844.jpg") {
            
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        if let url = URL(string: "https://4.imimg.com/data4/CQ/RX/MY-6038862/steel-king-containers-250x250.jpg") {
            
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        if let url = URL(string: "https://shibaniwebstore.com/media/catalog/category/gettyimages-178384298.jpg") {
            
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        if let url = URL(string: "https://industrydailyobserver.com/wp-content/uploads/2019/03/Home-Care-Products-Manufacturing.jpg") {
            
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        if let url = URL(string: "https://stat.homeshop18.com/homeshop18/images/productImages/973/personal-care-combo-by-dabur-medium_0bf0bf1ac6c39b89e3a4ab69b5839d2f.jpg") {
            
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
        if let url = URL(string: "https://d12ph5aixxtnio.cloudfront.net/uploads/images/general/_full/LVSnacks-Image-Letterbox-NoText.jpg") {
            
            do {
                let data = try Data(contentsOf: url)
                self.image1.append(UIImage(data: data)!)//This is for adding url image link to array
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
        }
       
       
       
        
        pageControl.numberOfPages = sliderArray.count
        pageControl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.imageChange), userInfo: nil, repeats: true)
         

                   }
        //MARK: Alamofire
               urlPAra()


        
    }
    
    
    @objc func imageChange() {
        
       
        
        if counter < sliderArray.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionImageView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        }else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionImageView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl.currentPage = counter
            counter = 1
            
        }
        
    }
       //Here we use table view with 2 cells
     
    @IBOutlet weak var tableView: UITableView!
    
    var sliderArray = [UIImage]()
    var image1 = [UIImage]()
    //This two things are added globally
   var title1 = global.title
    var description1 = global.description
    
     var array1 = [["Canned Fruit Drink","juices"],["Cream","Milk"],["Spreads"],["Flour","Other Grocery","Pulses","Rice","Salt","sugar"],["Air Fresheners","Cleaning","Laundry"],["Deo & Fragrance","Facial Care","Hair Care","Mens Care","Others"],["Popcorn"]]
    
}
extension shoppingPage: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return title1.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let row = indexPath.row
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableView1", for: indexPath) as! TableView1
        cell.tittle1.frame = CGRect(x: 158, y: 4, width: 202, height: 35)
                    cell.tittle1.text = title1[0]
                    cell.description1.frame = CGRect(x: 158, y: 28, width: 202, height: 38)
                    cell.description1.text = description1[0]
                    cell.imageView1.frame = CGRect(x: 0, y: 0, width: 150, height: 96)
                    cell.imageView1.image = image1[0]
//        if row == 0 {
//            cell.tittle1.frame = CGRect(x: 158, y: 4, width: 202, height: 35)
//            cell.tittle1.text = title1[0]
//            cell.description1.frame = CGRect(x: 158, y: 28, width: 202, height: 38)
//            cell.description1.text = description1[0]
//            cell.imageView1.frame = CGRect(x: 0, y: 0, width: 150, height: 96)
//            cell.imageView1.image = image1[0]
//        }
//        else if row == 1 {
//        cell.tittle1.frame = CGRect(x: 15, y: 11, width: 202, height: 35)
//        cell.tittle1.text = title1[1]
//        cell.description1.frame = CGRect(x: 15, y: 39, width: 202, height: 38)
//        cell.description1.text = description1[1]
//        cell.imageView1.frame = CGRect(x: 225, y: 0, width: 150, height: 96)
//        cell.imageView1.image = image1[1]
//        }
//        else if row == 2 {
//            cell.tittle1.text = title1[2]
//            cell.description1.text = description1[2]
//            cell.imageView1.image = image1[2]
//        }
//        else if row == 3 {
//            cell.tittle1.frame = CGRect(x: 15, y: 11, width: 202, height: 35)
//            cell.tittle1.text = title1[3]
//            cell.description1.frame = CGRect(x: 15, y: 39, width: 202, height: 38)
//            cell.description1.text = description1[3]
//            cell.imageView1.frame = CGRect(x: 225, y: 0, width: 150, height: 96)
//            cell.imageView1.image = image1[3]
//        }
//        else if row == 4 {
//            cell.tittle1.text = title1[4]
//            cell.description1.text = description1[4]
//            cell.imageView1.image = image1[4]
//        }
//        else if row == 5 {
//            cell.tittle1.frame = CGRect(x: 15, y: 11, width: 202, height: 35)
//            cell.tittle1.text = title1[5]
//            cell.description1.frame = CGRect(x: 15, y: 39, width: 202, height: 38)
//            cell.description1.text = description1[5]
//            cell.imageView1.frame = CGRect(x: 225, y: 0, width: 150, height: 96)
//            cell.imageView1.image = image1[5]
//        }
//        else if row == 6 {
//            cell.tittle1.frame = CGRect(x: 158, y: 4, width: 202, height: 35)
//            cell.tittle1.text = title1[6]
//            cell.description1.frame = CGRect(x: 158, y: 28, width: 202, height: 38)
//            cell.description1.text = description1[6]
//            cell.imageView1.frame = CGRect(x: 0, y: 0, width: 150, height: 96)
//            cell.imageView1.image = image1[6]
//        }
//
        
        return cell
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
      let view = self.storyboard?.instantiateViewController(withIdentifier: "segment") as! segment

        self.navigationController?.pushViewController(view, animated: true)
       
    }
    
    
    
}


//This is for showing an even array based on index path
// var title = ["dsf","Sf","fdg","df","fdg"]
//for (index, element) in title1.enumerated() {
//    if index % 2 == 0 {
//
//        cell.tittle1.text = title1[indexPath.row]
//        print(element)
//    }
//}
