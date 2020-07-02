//
//  NoteViewController.swift
//  MyNotesElnino
//
//  Created by El nino Cholo on 2020/07/01.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidAppear(_ animated: Bool) {
        loadItems()
    }
    @IBOutlet weak var tableViewerick: UITableView!
    
    var erickNotesAll:[ErickNotes] = [ErickNotes]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadtable()
        tableViewerick.delegate = self
        tableViewerick.dataSource = self
        self.tableViewerick.rowHeight = 250.0
        loadItems()
    
    }
   
    
    func reloadtable()
    {
        tableViewerick.reloadData()
        loadItems()
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 250.0
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewerick.deselectRow(at: indexPath, animated:true)
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return erickNotesAll.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "erickcell", for: indexPath) as! TableViewCell
        cell.setData(yourNotes: erickNotesAll[indexPath.row])
        cell.deleteButton.tag = indexPath.row
        cell.esditbutton.tag = indexPath.row
        
        cell.deleteButton.addTarget(self, action: #selector(deleteButton(_:)), for: UIControl.Event.touchUpInside)
        
        cell.esditbutton.addTarget(self, action: #selector(editButton(_:)), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    
    @objc func deleteButton(_ sender:UIButton)
    {
        context.delete(erickNotesAll[sender.tag])
        save()
        loadItems()
    }
    
    
    @objc func editButton(_ sender:UIButton)
    {
        performSegue(withIdentifier: "segue", sender: erickNotesAll[sender.tag])
        print(sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"
        {
            let secondVC = segue.destination as! ViewController
            if let notesObject = sender as? ErickNotes
            {
                secondVC.ninoNotes = notesObject
            }
        }
    }
    
    
    func save()
    {
        do
        {
            try context.save()
        }catch
        {
            print("There was an error while trying to save data",error)
        }
        tableViewerick.reloadData()
    }
    
    func loadItems(request:NSFetchRequest<ErickNotes> = ErickNotes.fetchRequest())
    {
        do
        {
            erickNotesAll = try context.fetch(request)
        }catch
        {
            print("There was an error while retreiving the data",error)
        }
        tableViewerick.reloadData()
    }
    
    

    @IBAction func addimtes(_ sender: Any)
    {
        performSegue(withIdentifier: "segue", sender: self)
    }
    

}
