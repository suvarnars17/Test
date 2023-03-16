public with sharing class IntergartionController {
    Http http =new Http();
    httpRequest request =new httpRequest();
    request.setEndPoint('');
    request.setMethod('GET');
    httpResponse response =http.send(request);
    if(response.getStatusCode =='200'){
        map<string, object> result=(Map<String,Object>).deserializeUntyped(response.getBody());
List<object> animals=(List<Object>).result.get('animals);
    }
}