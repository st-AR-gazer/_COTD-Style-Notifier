void StartServerComms() {
    g_jsonDataForServer = GetMapData();
    g_jsonDataForServerString = Json::Write(g_jsonDataForServer);

    startnew(SendInfoToServer);
}
