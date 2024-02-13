// maybe change this to directly store ase JSON instead of a dictionary

dictionary mapData;
void MapDataPopulate() {
    mapData['mapUid'] = "PlaceholderUID";
    mapData['mapName'] = "PlaceholderUID";
    mapData['mapType'] = "PlaceholderType";
    mapData['mapStyle'] = "PlaceholderStyle";
    mapData['authorNickName'] = "PlaceholderAuthor";
    mapData["pluginVersion"] = Meta::ExecutingPlugin().Version;
    mapData["time"] = Time::get_Now();
}

dictionary@ GetMapData() {
    if (g_mapInfo is null) { return mapData; }

    if (mapData.IsEmpty()) {
        dictionary data;
        data['mapUid'] = g_mapInfo.MapUid;
        data['mapName'] = g_mapInfo.Name;
        data['mapType'] = g_mapInfo.MapType;
        data['mapStyle'] = GetMapStyle();
        data['authorNickName'] = g_mapInfo.AuthorNickName;
        return data;
    } else {
        return mapData;
    }
}

string DictToJson(dictionary@ dict) {


    Json::Value root;

    array<string> keys = dict.GetKeys();
    for (uint i = 0; i < keys.Length; ++i) {
        string key = keys[i];
        string val;
        dict.Get(keys[i], val);

        root[key] = val;
    }

    return Json::Write(root);
}
