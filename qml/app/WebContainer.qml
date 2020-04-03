import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebEngine 1.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtWebChannel 1.13

import WebDataComponent 1.0

WebEngineView {
       id: _WebEngineView

       url:"http://192.168.0.58:7001/topcenter/OperationalArchitecture/detailsOperatorCompany"
      // url:"F:/doper-app/qml/index.html"
       anchors.fill: parent


       width: parent.width
       height: parent.height

       settings.pluginsEnabled: true
       settings.screenCaptureEnabled: true
       settings.allowRunningInsecureContent: true

       settings.javascriptEnabled: true
       webChannel: WebChannel{
           registeredObjects: [_WebDataComponent]
       }

       onJavaScriptConsoleMessage: {
           console.log(message)
       }
       onLoadProgressChanged:
       {

       }

       onSmoothChanged: {

       }


       onCertificateError: {
           console.log(error)
       }

       onFeaturePermissionRequested: {
           if(feature  == WebEngineView.MediaAudioCapture
                   || feature == WebEngineView.MediaAudioVideoCapture
                   || feature ==  WebEngineView.MediaVideoCapture){

               grantFeaturePermission(securityOrigin,feature,true)

           } else{
               grantFeaturePermission(securityOrigin,feature,false)

           }
       }
       onUrlChanged: {
           console.log("url : "+url)
       }

       WebDataComponent{
           id:_WebDataComponent
           WebChannel.id:"bdlbscWebDataComponent"
       }
}


