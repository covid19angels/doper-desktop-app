import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebEngine 1.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtWebChannel 1.13

import WebDataComponent 1.0

WebEngineView {
    id: pluginWebContainer

    //url:"http://192.168.0.58:7001/topcenter/OperationalArchitecture/detailsOperatorCompany"
    //
    //
    //url:"http://47.93.9.213/station/#/stage/dayOperating"
    // url:"http://47.93.9.213/opcenter/#/controlCenter/ShowMapBacklog"
    // url:"F:/doper-app/qml/index.html"
    anchors.fill: parent


    Component.onCompleted: {
//        if(globalStorage.loginPlatform == "TOPCENTER"){
//            url = "http://47.93.9.213/topcenter/#/OperationalArchitecture/detailsOperatorCompany"
//        }else if(globalStorage.loginPlatform == "AREACENTER"){
//            url = "http://47.93.9.213/areacenter/#/OperationalArchitecture/detailsCenter"
//        }else if(globalStorage.loginPlatform == "OPCENTER"){
//            url ="http://47.93.9.213/opcenter/#/controlCenter/ShowMapBacklog"
//        }else if(globalStorage.loginPlatform == "STATION"){
//            url = "http://47.93.9.213/station/#/stage/dayOperating"
//        }
//        url = "https://www.baidu.com"
    }

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

//    onNewViewRequested: {
//        console.log(request.requestedUrl)
//        var newWebContainer = Qt;
//        request.openIn(newWebContainer);
//    }

    WebDataComponent{
        id:_WebDataComponent
        WebChannel.id:"bdlbscWebDataComponent"
    }
}


