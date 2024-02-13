void StartSeverComms() {
    g_jsonDataForServer = GetMapData(); // g_jsonDataForServer is defined in the SendInfoToServer function

    startnew(SendInfoToServer);
}