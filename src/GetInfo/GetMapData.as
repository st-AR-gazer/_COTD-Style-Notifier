dictionary mapData;
void MapDataPopulate() {
	mapData['mapUid'] = g_mapInfo.mapUid;
    mapData['mapName'] = g_mapInfo.mapName;
    mapData['mapType'] = g_mapInfo.mapType;
    mapStyle['mapStyle'] = GetMapStyle();
    mapData['authorNickName'] = g_mapInfo.authorNickName;
}

void GetMapData() {
    dictionary data = mapData;
}