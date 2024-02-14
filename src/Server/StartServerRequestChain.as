void StartServerComms() {
    g_jsonDataForServer = GetMapData();
    g_jsonDataString = Json::Write(g_jsonDataForServer);

    startnew(SendInfoToServer);
}
