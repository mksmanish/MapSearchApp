# MapSearchApp
  This contains a single page with search and mapkit ,search the searched loaction on map.<br>
  1)Enter the required location in the searchbar.<br>
  2)It will print the long and lat in console.<br>
  3)with annonation on the map.<br>
   ```
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        let searchValue = MKLocalSearch.Request()
        searchValue.naturalLanguageQuery = searchCountry.text
        let activeSearch = MKLocalSearch(request: searchValue)
        
        // active search will search the text entered in the searchbar
        activeSearch.start { (response, error) in
            if response == nil {
                // if entered text is wrong
                print(error?.localizedDescription ?? "")
            }else{
                // if enetered text is vaild
                let lat = response?.boundingRegion.center.latitude
                let long = response?.boundingRegion.center.longitude
                print("latitude= \(lat),longitude=\(long)")
                
                // annonation with name on the map
                let annotation = MKPointAnnotation()
                annotation.title = self.searchCountry.text
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
                self.mapView.addAnnotation(annotation)
                
                let coodinaate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, long!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coodinaate, span: span)
                
                self.mapView.setRegion(region, animated: true)
            }
        }
        
    }
   ```
<br>  
<img src = "https://github.com/mksmanish/MapSearchApp/blob/main/Screen/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-08-24%20at%2017.48.34.png" width="200" height="400" ><br>    
    
  
