let
    //Enter the script token you generated from Teamviewer site that has access to the items you want to analyze in PowerBI
    YourAPIToken="APIToken",
    //Enter the type of items you want to collect from devices registered in Monitoring Management. Options: information, hardware, software 
    CollectItems="hardware",
    
    //This will collect a list of devices to iterate through. The script will make an api call to get unique id of each device registered and make them avaialable in json to analyze 
    Source = Json.Document(Web.Contents("https://webapi.teamviewer.com/api/v1/" & "monitoring/devices", [Headers=[Authorization="Bearer " & YourAPIToken, Accept="application/json"]])),
    #"Expanded Column1" = Table.ExpandRecordColumn(Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error), "Column1", {"TeamviewerId"}, {"TeamviewerId"}),
    TeamviewerIds = #"Expanded Column1"[TeamviewerId],    
     GetDeviceInfo = (id) => Web.Contents("https://webapi.teamviewer.com/api/v1/monitoring/devices/" & Text.From(id) & "/" & CollectItems, [Headers=[Authorization="Bearer " & YourAPIToken, Accept="application/json"]]),
    DeviceInfoText = List.Transform(TeamviewerIds, each Text.FromBinary(GetDeviceInfo(_))),
    //Converting to json to make parsing easier
    #"DeviceInfo" = List.Transform(DeviceInfoText, each Json.Document(_))
in
    #"DeviceInfo"