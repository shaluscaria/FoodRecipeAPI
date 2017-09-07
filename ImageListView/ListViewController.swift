//
//  ViewController.swift
//  ImageListView
//
//  Created by Shalu Scaria on 2017-09-06.
//  Copyright © 2017 Shalu Scaria. All rights reserved.
//

import UIKit
import Alamofire



class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var recipeArray_list = [Recipes]()
    @IBOutlet var recipeTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // To get the data from the food2forkapi call using Alamofire framework
    func getData()
    {
        Alamofire.request("https://food2fork.com/api/search?key=571b59e87af50037585a26ff3ad761eb&q=shredded%20chicken").responseJSON {response in
                self.toObjects(data: response.data!)
        }
    }

    
    //converting the response data to recipe model object
    func toObjects(data: Data)
    {
        let recipeResult: [String:AnyObject]!
        do {
            recipeResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            let recipeArray =  recipeResult["recipes"] as! [AnyObject]
            
            //Obtaining arraylist of Recipes from the given dictionaryu array of recipes
            recipeArray_list = Recipes.modelsFromDictionaryArray(array: recipeArray as NSArray)
            recipeTableView.reloadData()
            
        } catch {
            print("Could not parse the data as JSON: '\(data)'")
            return
        }
        
    }
    
    

    //Mark :- UITableViewDataSource Delegation methods
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomTableCell
        
        let dish = recipeArray_list[indexPath.row]
        cell.recipeTitle?.text = dish.title
        
        //Load Image icon
        let imageURL = URL(string: dish.image_url!)
        Alamofire.request(imageURL!).responseJSON {response in
            let imageData = response.data!
            let downloadImage = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.recipeImage?.image = downloadImage
            }
        }
        return cell
    }

    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArray_list.count
    }


    


}

