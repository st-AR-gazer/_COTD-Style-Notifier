Json::Value mapData;

void MapDataPopulateDefault() {
    mapData["isPlaceholder"] = true;
    mapData["mapUid"] = "PlaceholderUID";
    mapData["mapName"] = "PlaceholderName";
    mapData["mapType"] = "PlaceholderType";
    mapData["mapStyle"] = "PlaceholderStyle";
    mapData["authorNickName"] = "PlaceholderAuthor";
    mapData["pluginVersion"] = Meta::ExecutingPlugin().Version;
    mapData["time"] = Time::Now;
}

Json::Value GetMapData() {
    if (g_mapInfo is null) { return mapData; }

    if (mapData.Length == 0) {
        Json::Value data;
        data["isPlaceholder"] = false;
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