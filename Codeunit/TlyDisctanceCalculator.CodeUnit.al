codeunit 50040 "Distance Calculator"
{
    procedure GetDistanceKM(
        ToAddress: Text;
        ToCity: Text;
        ToPostCode: Text;
        var ErrorMsg: Text): Decimal
    var
        WarehouseLat: Decimal;
        WarehouseLon: Decimal;
        DestLat: Decimal;
        DestLon: Decimal;
    begin
        ErrorMsg := '';

        // Torlys Warehouse
        WarehouseLat := 43.6823;
        WarehouseLon := -79.6644;

        if not GetCoordinates(
            ToAddress,
            ToCity,
            ToPostCode,
            DestLat,
            DestLon,
            ErrorMsg)
        then
            exit(0);

        exit(
            GetRouteDistance(
                WarehouseLat,
                WarehouseLon,
                DestLat,
                DestLon,
                ErrorMsg));
    end;

    local procedure GetCoordinates(
        Address: Text;
        City: Text;
        PostCode: Text;
        var Latitude: Decimal;
        var Longitude: Decimal;
        var ErrorMsg: Text): Boolean
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        ResponseText: Text;
        Url: Text;
        ApiKey: Text;

        JsonObject: JsonObject;
        FeaturesToken: JsonToken;
        FeaturesArray: JsonArray;
        FeatureToken: JsonToken;
        FeatureObject: JsonObject;

        GeometryToken: JsonToken;
        GeometryObject: JsonObject;

        CoordinatesToken: JsonToken;
        CoordinatesArray: JsonArray;

        LonToken: JsonToken;
        LatToken: JsonToken;
    begin
        ApiKey := '6cc3b86508fb45fabb2b70c98f85b2e3';

        Url :=
            'https://api.geoapify.com/v1/geocode/search?' +
            'text=' +
            EncodeUrl(
                Address + ', ' +
                City + ', ' +
                PostCode + ', Canada') +
            '&limit=1' +
            '&apiKey=' + ApiKey;

        if not Client.Get(Url, Response) then begin
            ErrorMsg := 'Unable to reach Geoapify';
            exit(false);
        end;

        if not Response.IsSuccessStatusCode() then begin
            ErrorMsg := 'Geoapify Error';
            exit(false);
        end;

        Response.Content.ReadAs(ResponseText);

        if not JsonObject.ReadFrom(ResponseText) then begin
            ErrorMsg := 'Invalid Geoapify response';
            exit(false);
        end;

        if not JsonObject.Get('features', FeaturesToken) then begin
            ErrorMsg := 'Address not found';
            exit(false);
        end;

        FeaturesArray := FeaturesToken.AsArray();

        if FeaturesArray.Count() = 0 then begin
            ErrorMsg := 'Address not found';
            exit(false);
        end;

        FeaturesArray.Get(0, FeatureToken);
        FeatureObject := FeatureToken.AsObject();

        if not FeatureObject.Get('geometry', GeometryToken) then begin
            ErrorMsg := 'Geometry missing';
            exit(false);
        end;

        GeometryObject := GeometryToken.AsObject();

        if not GeometryObject.Get('coordinates', CoordinatesToken) then begin
            ErrorMsg := 'Coordinate missing';
            exit(false);
        end;

        CoordinatesArray := CoordinatesToken.AsArray();

        CoordinatesArray.Get(0, LonToken);
        CoordinatesArray.Get(1, LatToken);

        Longitude := LonToken.AsValue().AsDecimal();
        Latitude := LatToken.AsValue().AsDecimal();

        exit(true);
    end;

    local procedure GetRouteDistance(
        StartLat: Decimal;
        StartLon: Decimal;
        EndLat: Decimal;
        EndLon: Decimal;
        var ErrorMsg: Text): Decimal
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        ResponseText: Text;
        Url: Text;
        ApiKey: Text;

        JsonObject: JsonObject;
        FeaturesToken: JsonToken;
        FeaturesArray: JsonArray;

        FeatureToken: JsonToken;
        FeatureObject: JsonObject;

        PropertiesToken: JsonToken;
        PropertiesObject: JsonObject;

        DistanceToken: JsonToken;
        DistanceMeters: Decimal;
    begin
        ApiKey := '6cc3b86508fb45fabb2b70c98f85b2e3';

        Url :=
            'https://api.geoapify.com/v1/routing?' +
            'waypoints=' +
            Format(StartLat) + ',' +
            Format(StartLon) +
            '|' +
            Format(EndLat) + ',' +
            Format(EndLon) +
            '&mode=drive' +
            '&apiKey=' + ApiKey;

        if not Client.Get(Url, Response) then begin
            ErrorMsg := 'Routing server unavailable';
            exit(0);
        end;

        if not Response.IsSuccessStatusCode() then begin
            ErrorMsg := 'Routing request failed';
            exit(0);
        end;

        Response.Content.ReadAs(ResponseText);

        if not JsonObject.ReadFrom(ResponseText) then begin
            ErrorMsg := 'Invalid routing response';
            exit(0);
        end;

        if not JsonObject.Get('features', FeaturesToken) then begin
            ErrorMsg := 'No route returned';
            exit(0);
        end;

        FeaturesArray := FeaturesToken.AsArray();

        if FeaturesArray.Count() = 0 then begin
            ErrorMsg := 'No route found';
            exit(0);
        end;

        FeaturesArray.Get(0, FeatureToken);
        FeatureObject := FeatureToken.AsObject();

        if not FeatureObject.Get('properties', PropertiesToken) then begin
            ErrorMsg := 'Route properties missing';
            exit(0);
        end;

        PropertiesObject := PropertiesToken.AsObject();

        if not PropertiesObject.Get('distance', DistanceToken) then begin
            ErrorMsg := 'Distance not returned';
            exit(0);
        end;

        DistanceMeters :=
            DistanceToken.AsValue().AsDecimal();

        exit(
            Round(
                DistanceMeters / 1000,
                0.01,
                '='));
    end;

    local procedure EncodeUrl(TextValue: Text): Text
    begin
        TextValue := TextValue.Replace(' ', '%20');
        TextValue := TextValue.Replace(',', '%2C');
        TextValue := TextValue.Replace('#', '%23');
        TextValue := TextValue.Replace('&', '%26');
        TextValue := TextValue.Replace('/', '%2F');

        exit(TextValue);
    end;
}