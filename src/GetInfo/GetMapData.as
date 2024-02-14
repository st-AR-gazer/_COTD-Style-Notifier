Json::Value mapData;

void MapDataPopulateDefault() {
    Json::Value tmp = Json::Object();

    tmp["isPlaceholder"] = true;
    tmp["requestType"] = "PlaceholderRequestType";
    tmp["mapUid"] = "PlaceholderUID";
    tmp["mapName"] = "PlaceholderName";
    tmp["mapType"] = "PlaceholderType";
    tmp["mapStyle"] = "PlaceholderStyle";
    tmp["authorNickName"] = "PlaceholderAuthor";
    tmp["pluginVersion"] = Meta::ExecutingPlugin().Version;
    tmp["time"] = Time::Now;

    mapData = tmp;
}

Json::Value GetMapData() {
    if (g_mapInfo is null) { return mapData; }
    log("GetMapData() has been called", LogLevel::Info, 21);

    if (mapData.Length == 0) {
        Json::Value data;
        data["isPlaceholder"] = false;
        data["requestType"] = "COTD-StyleNotifyer";
        data["mapUid"] = g_mapInfo.MapUid;
        data["mapName"] = g_mapInfo.Name;
        data["mapType"] = g_mapInfo.MapType;
        data["mapStyle"] = GetMapStyle();
        data["authorNickName"] = g_mapInfo.AuthorNickName;
        data["pluginVersion"] = Meta::ExecutingPlugin().Version;
        data["time"] = GetTimeF();

        mapData = data;

        return data;
    } else {
        return mapData;
    }
}