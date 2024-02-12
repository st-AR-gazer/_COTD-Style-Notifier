auto g_app;
auto g_network;
auto g_serverInfo;
auto g_mapInfo;


void Main() {
    log("Main func has started", LogLevel::Info, 6);
    NadeoServices::AddAudience("NadeoClubServices");
    while (!NadeoServices::IsAuthenticated("NadeoClubServices")) {
      yield();
    }
    if (!Perms()) return;
    if (!IsCurrentlyInCOTD()) return;

    MapDataPopulate();

	auto t_data;
    t_data = GetMapData();

    startnew(SendInfoToServer(t_data));
}

void Update(float dt) {
    g_app = cast<CTrackMania>(GetApp());
    g_network = cast<CTrackManiaNetwork>(g_app.Network);
    g_serverInfo = cast<CTrackManiaNetworkServerInfo>(g_network.ServerInfo);
    
    g_mapInfo = g_app.RootMap.MapInfo;
}