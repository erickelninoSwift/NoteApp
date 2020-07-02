//
//  ViewController.swift
//  MyNotesElnino
//
//  Created by El nino Cholo on 2020/07/01.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var Notes:ErickNotes = ErickNotes()
    var ninoNotes:ErickNotes?
    
    
    
    @IBOutlet weak var detailsDescField: UITextView!
    @IBOutlet weak var titletextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assigning()
      
    }
    
    
    func assigning()
    {
        if let rightnot = ninoNotes
        {
            titletextField.text = rightnot.title!
            detailsDescField.text = rightnot.details!
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton)
    {
        
        if let rightnot = ninoNotes
        {
             Notes = rightnot
            
        }else
        {
            Notes = ErickNotes(context: context)
        }
        
        
            Notes.title = titletextField.text!
            Notes.details = detailsDescField.text!
            Notes.date = Date()
            saveData()
            alert()
            
    }
    
    
    
    func saveData()
    {
        do
        {
            try context.save()
            
        }catch
        {
            print("There was an error while trying to save notes",error)
            
        }
        
    }
    
    func restField()
    {
        detailsDescField.text = ""
        titletextField.text = ""
        
    }
    
    func alert()
    {
        let Alert = UIAlertController(title: "Message", message: "You saved your note", preferredStyle: UIAlertController.Style.alert)
        let Action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (erickelnino) in
            self.restField()
            self.dismiss(animated: true, completion: nil)
        }
        Alert.addAction(Action)
        self.present(Alert, animated: true, completion: nil)
    }
    
    
    @IBAction func backbutton(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
       
    }
    
    
}

