//
//  Recipe.swift
//  ImageListView
//
//  Created by Shalu Scaria on 2017-09-07.
//  Copyright © 2017 Shalu Scaria. All rights reserved.
//



import Foundation


//Model class for the JSON

public class Recipe {
    
    public var publisher : String?
    public var f2f_url : String?
    public var title : String?
    public var source_url : String?
    public var recipe_id : Double?
    public var image_url : String?
    public var social_rank : String?
    public var publisher_url : String?
    
    
    //Initializes the Recipe instances based on the given dictionary
    
    init(dictionary: NSDictionary) {
        
        publisher = dictionary["publisher"] as? String
        f2f_url = dictionary["f2f_url"] as? String
        title = dictionary["title"] as? String
        source_url = dictionary["source_url"] as? String
        recipe_id = dictionary["recipe_id"] as? Double
        image_url = dictionary["image_url"] as? String
        social_rank = dictionary["social_rank"] as? String
        publisher_url = dictionary["publisher_url"] as? String
    }

    
    
    
   //Returns an array of Recipe instance from a dictionary array
    
   public func modelsFromDictionaryArray(array:NSArray) -> [Recipe]{
        var models:[Recipe] = []
        for item in array {
            models.append(Recipe(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    
    
    
}
