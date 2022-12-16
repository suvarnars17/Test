public class SaleforceConnect {
 public static String getCaseesFromSaleforceOrgB(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://raagvitech9-dev-ed.develop.my.salesforce.com/services/apexrest/Cases');
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer !AQEAQPR9pSqTZf9hhVP.DwGdt_Hih6WPXfkaS7bDLkLGM7Vw67QzrqSyFsx1bEMOS5Wv41dCigSwWPGArKq.48U3Gyw.0LSV');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug(response.getBody());
            return response.getBody();
        }
        return '';
    }
}