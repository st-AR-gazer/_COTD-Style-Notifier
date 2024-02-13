void StartSeverComms() {
    dictionary@ t_data = GetMapData();
    g_jsonDataForServer = DictToJson(t_data);

    startnew(SendInfoToServer);
}