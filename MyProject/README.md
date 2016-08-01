#update Date : 2016.07.29

#Project NAME
**Pokedex**

#What I did?
   * **first** : Login and sign up page, paths of each view controllers
   * **second** : implementing collection view and table view controller
   * **third** : linkage current project to sever with using AFNetworking api
   * **fourth** : the location of an image with using GPS and MapView api

#The goal of project
   **ios**
   * the way of simple log-in (Login-in and sign-up with SNS)
   * upload pictures to collection view and table view (ImagePickerController)
   * transmission selected library photo or taken photo to server
   * producing Apple map with GPS service (CLLocation,MapView)
   * storing the location of uploaded photo to Metadata (PHAssetLibrary)
   * producing the location of Photo on the map

   **Server**
   * creating user model ( ID,Password)
   * implementing of Facebook login
   * creating Api (AFNetworking, FacebookSDK)
   * user token value (KeychainItemWrapper)

#Issue
   * what should it be done if the photo does not have GPS data? 
   * check GPS Meta data if it doesn’t have anything, it won’t process to map view page
